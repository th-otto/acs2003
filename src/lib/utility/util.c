/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Misc utilities                                        */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acsport.h"
#include "acs_i.h"

int16 a_dialog_active = FALSE;

static void fitin(Axywh *to, const Axywh *from);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 Awi_keys(Awindow *window, int16 kstate, int16 key)
{
	int16 ret;
	
	ret = Awi_keysend(window, kstate, key);
	return ret < -1 ? -1 : ret;
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

int16 Awi_sendkey(Awindow *win, int16 kstate, int16 key)
{
	if (key < 0) /* key & NKF_FUNC */
	{
		switch ((char) key)
		{
		case NK_HELP:
			if (Awi_help(win) != FALSE)
				return -1;
			break;
		}
	}
	return -2;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

int16 Awi_nokey(Awindow *win, int16 kstate, int16 key)
{
	if (key < 0) /* key & NKF_FUNC */
	{
		switch ((char) key)
		{
		case NK_HELP:
			Awi_help(win);
			break;
		}
	}
	return -1;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

int16 Aob_within(const Axywh *rect, int16 x, int16 y)
{
	if (x < rect->x)
		return FALSE;
	if (y < rect->y)
		return FALSE;
	if (x >= rect->x + rect->w)
		return FALSE;
	if (y >= rect->y + rect->h)
		return FALSE;
	return TRUE;
}

/* -------------------------------------------------------------------------- */

int16 alert_str(const char *alert, const char *para)
{
	char buf[256];
	char *ptr;
	
	ptr = buf;
	while (*alert != '\0')
	{
		if (*alert == '%' && alert[1] == 's')
		{
			alert += 2;
			break;
		}
		*ptr++ = *alert++;
	}
	*ptr = '\0';
	strncat(ptr, para, 30);
	strcat(ptr, alert);
	return Awi_alert(1, buf);
}

/* -------------------------------------------------------------------------- */

int16 alert(const char *str)
{
	char buf[256];

	strcpy(buf, "[3][");
	strcat(buf, str);
	strcat(buf, "][ OK ]");
	return Awi_alert(1, buf);
}

/* -------------------------------------------------------------------------- */

static void dia_obchange(Awindow *win, int16 obnr, int16 state)
{
	OBJECT *tree;
	OBJECT *obj;
	Axywh rect;
	
	tree = ACSblk->ev_object;
	obj = &tree[obnr];
	Aob_offset(&rect, tree, obnr);
	if ((char)obj->ob_type == G_CICON)
	{
		Awi_obredraw(win, obnr);
	} else
	{
		if (state == -1 || obj->ob_state == state)
			objc_draw(tree, obnr, 6, rect.x, rect.y, rect.w, rect.h);
		else
			objc_change(tree, obnr, 0, rect.x, rect.y, rect.w, rect.h, state, TRUE);
	}
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

static void dia_redraw(Awindow *win, Axywh *area)
{
	objc_draw(ACSblk->ev_object, ROOT, 6, area->x, area->y, area->w, area->h);
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

static int16 Aform_do(OBJECT *tree, int16 *pedit)
{
	int16 edit;
	int16 state;
	int16 next_obj;
	int16 events;
	boolean cont;
	int16 key;
	int16 col;
	char savec;
	char *text;
	
	next_obj = 0;
	ACSblk->ev_object = tree;
	if (*pedit <= 0)
		edit = Aob_findflag(tree, ROOT, OF_EDITABLE);
	else
		edit = *pedit;
	*pedit = 0;
	if (edit <= 0)
		edit = 0;
	cont = TRUE;
	while (cont)
	{
		if (edit != 0 && *pedit != edit)
		{
			*pedit = edit;
			edit = 0;
			if (tree[*pedit].ob_flags & OF_EDITABLE)
				objc_edit(tree, *pedit, 0, &col, ED_INIT);
		}
		events = evnt_multi(MU_BUTTON | MU_KEYBD,
			ACSblk->ev_mbclicks, ACSblk->ev_bmask, ACSblk->ev_bstate,
			0, 0, 0, 0, 0,
			0, 0, 0, 0, 0,
			NULL,
			0, 0,
			&ACSblk->ev_mmox, &ACSblk->ev_mmoy, &ACSblk->ev_mmobutton, &ACSblk->ev_mmokstate, &ACSblk->ev_mkreturn, &ACSblk->ev_mbreturn);
		ACSblk->ev_mkreturn = nkc_gemks2n(ACSblk->ev_mkreturn, ACSblk->ev_mmokstate);

		if (events & MU_KEYBD)
		{
			ACSblk->ACSkey(&ACSblk->ev_mmokstate, &ACSblk->ev_mkreturn);
			ACSblk->ACSwikey(&ACSblk->ev_mmokstate, &ACSblk->ev_mkreturn);
			if (ACSblk->ev_mkreturn != 0)
			{
				events = 0;
				key = Aob_key(tree, ACSblk->ev_mmokstate, ACSblk->ev_mkreturn);
				if (key >= 0)
				{
					edit = key;
					cont = form_button(tree, edit, 1, &edit);
				} else
				{
					if ((ACSblk->ev_mkreturn & NKF_CTRL) == 0 ||
						(ACSblk->ev_mkreturn & NKF_CTRL) != (ACSblk->ev_mkreturn & (NKF_CTRL | NKF_CAPS | NKF_ALT | NKF_SHIFT)) ||
						(char)ACSblk->ev_mkreturn != NK_TAB ||
						!Aob_chdef(ACSblk->ev_window, tree))
					{
						cont = form_keybd(tree, *pedit, *pedit, nkc_n2gem(ACSblk->ev_mkreturn), &edit, &next_obj);
						if ((tree[*pedit].ob_flags & OF_LASTOB) && edit > *pedit)
							edit = *pedit;
						if (next_obj != 0 && (tree[*pedit].ob_flags & OF_EDITABLE))
						{
							switch ((char)ACSblk->ev_mkreturn)
							{
							case 0:
								break;
							case NK_LEFT:
								if (ACSblk->ev_mkreturn & (NKF_FUNC | NKF_SHIFT))
								{
									objc_edit(tree, *pedit, 0, &col, ED_END);
									text = tree[*pedit].ob_spec.tedinfo->te_ptext;
									savec = *text;
									*text = '\0';
									objc_edit(tree, *pedit, 0, &col, ED_INIT);
									*text = savec;
									break;
								}
								/* fall through */
							
							case NK_RIGHT:
								if (ACSblk->ev_mkreturn & (NKF_FUNC | NKF_SHIFT))
								{
									objc_edit(tree, *pedit, 0, &col, ED_END);
									objc_edit(tree, *pedit, 0, &col, ED_INIT);
									break;
								}								
								/* fall through */
							
							default:
								if (tree[*pedit].ob_flags & OF_EDITABLE)
								{
									objc_edit(tree, *pedit, nkc_n2gem(ACSblk->ev_mkreturn), &col, ED_CHAR);
								}
								break;
							}
						}
					}
				}
			}
		}

		if (events & MU_BUTTON)
		{
			ACSblk->ACSbutton(&ACSblk->ev_mmobutton, &ACSblk->ev_mbreturn);
			edit = objc_find(tree, ROOT, 6, ACSblk->ev_mmox, ACSblk->ev_mmoy);
			if (edit == NIL)
			{
				edit = 0;
				if (ACSblk->ev_mbreturn == 2)
				{
					cont = FALSE;
				} else
				{
					state = tree->ob_state;
					if (ACSblk->description->flags & AB_ACUSTIC)
					{
						Bconout(2, 7);
					} else
					{
						if (graf_watchbox(tree, ROOT, state, state | OS_SELECTED) == 0)
							dia_obchange(ACSblk->ev_window, ROOT, state);
					}
				}
			} else
			{
				if (!(tree[edit].ob_state & OS_DISABLED))
				{
					cont = form_button(tree, edit, 1, &edit);
				} else
				{
					edit = 0;
				}
			}
		}

		if ((!cont ||
			 (edit != 0 && edit != *pedit)) &&
			(tree[*pedit].ob_flags & OF_EDITABLE))
		{
			objc_edit(tree, *pedit, 0, &col, ED_END);
		}
	}
	
	if (ACSblk->ev_mbreturn == 2)
		tree[edit].ob_state |= AOS_DCLICK;
	else
		tree[edit].ob_state &= ~AOS_DCLICK;
	return edit;
}

/* -------------------------------------------------------------------------- */

void Act_save(CONTEXT *ctx)
{
	ctx->window = ACSblk->ev_window;
	ctx->object = ACSblk->ev_object;
	ctx->obnr = ACSblk->ev_obnr;
	ctx->mmox = ACSblk->ev_mmox;
	ctx->mmoy = ACSblk->ev_mmoy;
	ctx->mmokstate = ACSblk->ev_mmokstate;
	ctx->busy = Amo_restart(&ctx->mouse);
}

/* -------------------------------------------------------------------------- */

void Act_restore(CONTEXT *ctx)
{
	ACSblk->ev_window = ctx->window;
	ACSblk->ev_object = ctx->object;
	ACSblk->ev_obnr = ctx->obnr;
	ACSblk->ev_mmox = ctx->mmox;
	ACSblk->ev_mmoy = ctx->mmoy;
	ACSblk->ev_mmokstate = ctx->mmokstate;
	Amo_return(ctx->busy, &ctx->mouse);
}

/* -------------------------------------------------------------------------- */

boolean A_isModDia(void)
{
	return a_dialog_active > 0;
}

/* -------------------------------------------------------------------------- */

static int16 A_exdialog(OBJECT *tree, boolean aligned)
{
	int16 mox;
	int16 moy;
	CONTEXT ctx;
	void (*redraw)(Awindow *a, Axywh *b);
	void (*obchange)(Awindow *a, int16 obnr, int16 new_state);
	AOBJECT *aobj;
	Axywh rect;
	Axywh wi_work;
	MFDB *bp;
	int16 obnr;
	int16 wi_state;
	int16 dummy;
	int16 edit;
	
	Aev_unhidepointer();
	Act_save(&ctx);
	Aob_fix(tree);
	redraw = ACSblk->ev_window->redraw;
	obchange = ACSblk->ev_window->obchange;
	wi_state = ACSblk->ev_window->state;
	memcpy(&wi_work, &ACSblk->ev_window->wi_work, sizeof(wi_work));
	ACSblk->ev_window->wi_work.x = ACSblk->ev_window->wi_work.y = 0;
	ACSblk->ev_window->wi_work.w = ACSblk->desk.x + ACSblk->desk.w;
	ACSblk->ev_window->wi_work.h = ACSblk->desk.y + ACSblk->desk.h;
	ACSblk->ev_window->redraw = dia_redraw;
	ACSblk->ev_window->obchange = dia_obchange;
	ACSblk->ev_window->state |= AWS_MODAL;
	edit = 0;
	if (aligned)
	{
		if (ACSblk->description->flags & AB_CENTERDIALOG)
		{
			form_center(tree, &rect.x, &rect.y, &rect.w, &rect.h);
		} else
		{
			graf_mkstate(&mox, &moy, &dummy, &dummy);
			mox &= -64;
			moy &= -64;
			rect.x = mox - (tree->ob_width >> 1);
			rect.y = moy - (tree->ob_height >> 1);
		}
	} else
	{
		rect.x = tree->ob_x - 8;
		rect.y = tree->ob_y - 8;
	}
	rect.w = tree->ob_width + 8;
	rect.h = tree->ob_height + 8;
	++a_dialog_active;
	Awi_update(BEG_MCTRL);
	Awi_show_menu(FALSE);
	
	while (TRUE)
	{
		fitin(&rect, &ACSblk->desk);
		tree->ob_x = rect.x + 4;
		tree->ob_y = rect.y + 4;
		bp = Aob_save(&rect);
		objc_draw(tree, ROOT, 6, ACSblk->desk.x, ACSblk->desk.y, ACSblk->desk.w, ACSblk->desk.h);
		obnr = 0;
		while (TRUE)
		{
			obnr = Aform_do(tree, &edit);
			if (tree[obnr].ob_flags & AO_DRAGABLE)
				break;
			aobj = (AOBJECT *)&tree[obnr] + 1;
			if (!(tree[obnr].ob_flags & OF_LASTOB) && (aobj->ob_flags & AEO) && aobj->click != NULL)
			{
				ACSblk->ev_object = tree;
				ACSblk->ev_obnr = obnr;
				ACSblk->dia_abort = FALSE;
				aobj->click();
				if ((tree[obnr].ob_flags & OF_SELECTABLE) &&
					!(tree[obnr].ob_flags & OF_TOUCHEXIT) &&
					(tree[obnr].ob_state & OS_SELECTED))
					dia_obchange(ACSblk->ev_window, obnr, tree[obnr].ob_state & ~OS_SELECTED);
				if (ACSblk->dia_abort)
					break;
			} else
			{
				if ((tree[obnr].ob_flags & (AO_DRAGABLE | OF_SELECTABLE | OF_DEFAULT | OF_EXIT | OF_TOUCHEXIT)) != OF_TOUCHEXIT)
					break;
			}
		}
		tree[obnr].ob_state &= ~OS_SELECTED;
		Aob_restore(bp, &rect);
		if (obnr == ROOT && (tree[ROOT].ob_state & AOS_DCLICK))
			break;
		if (!(tree[obnr].ob_flags & AO_DRAGABLE))
			break;
		graf_dragbox(tree->ob_width, tree->ob_height, tree->ob_x, tree->ob_y,
			ACSblk->desk.x, ACSblk->desk.y, ACSblk->desk.w, ACSblk->desk.h,
			&rect.x, &rect.y);
		rect.x -= 4;
		rect.y -= 4;
	}
	
	ACSblk->dia_abort = FALSE;
	Awi_update(END_MCTRL);
	--a_dialog_active;
	ACSblk->ev_window->redraw = redraw;
	ACSblk->ev_window->obchange = obchange;
	ACSblk->ev_window->state = wi_state;
	memcpy(&ACSblk->ev_window->wi_work, &wi_work, sizeof(ACSblk->ev_window->wi_work));
	Act_restore(&ctx);
	Awi_show_menu(TRUE);
	
	return obnr;
}

/* -------------------------------------------------------------------------- */

int16 A_dialog(OBJECT *dia)
{
	return A_exdialog(dia, TRUE);
}

/* -------------------------------------------------------------------------- */

int16 A_dialog2(OBJECT *dia)
{
	return A_exdialog(dia, FALSE);
}

/* -------------------------------------------------------------------------- */

static void fitin(Axywh *to, const Axywh *from)
{
	if (to->x < from->x)
		to->x = from->x;
	if (to->y < from->y)
		to->y = from->y;
	if (to->x + to->w > from->x + from->w)
		to->x = from->x + from->w - to->w;
	if (to->y + to->h > from->y + from->h)
		to->y = from->y + from->h - to->h;
}

/* -------------------------------------------------------------------------- */

boolean intersect(Axywh *to, const Axywh *from)
{
	int16 tx;
	int16 ty;
	
	tx = min(to->x + to->w, from->x + from->w);
	ty = min(to->y + to->h, from->y + from->h);
	to->x = max(to->x, from->x);
	to->y = max(to->y, from->y);
	to->w = tx - to->x;
	to->h = ty - to->y;
	if (to->w <= 0 || to->h <= 0)
	{
		to->w = to->h = 0;
		return FALSE;
	} else
	{
		return TRUE;
	}
}

/* -------------------------------------------------------------------------- */

void xywh2array(int16 *to, const Axywh *from)
{
	*to++ = from->x;
	*to++ = from->y;
	*to++ = from->x + from->w - 1;
	*to = from->y + from->h - 1;
}

/* -------------------------------------------------------------------------- */

void array2xywh(Axywh *to, const int16 *from)
{
	to->x = from[0];
	to->y = from[1];
	to->w = from[2] - to->x + 1;
	to->h = from[3] - to->y + 1;
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void scrp_chg(int16 drv)
{
	int16 msg[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
	int16 apptype;
	int16 id;
	char fname[10];
	
	id = -1;
	msg[0] = SC_CHANGED;
#if WITH_FIXES
	msg[1] = ACSblk->gl_apid;
#else
	msg[2] = ACSblk->gl_apid;
#endif
	Ash_sendall(msg, -1);
	if (ACSblk->AESglobal[0] >= 0x400 || _ACSv_magix >= 0x200)
	{
		if (appl_search(APP_FIRST | APP_APPLICATION, fname, &apptype, &id) == 0)
			id = -1;
	} else
	{
		if (!ACSblk->multitask)
			id = 0;
	}
	if (id >= 0)
	{
		msg[0] = SH_WDRAW;
		msg[3] = drv;
		appl_write(id, (int)sizeof(msg), msg);
	}
	Awi_sendall(AS_SCRAP_UPDATE, NULL);
}

/* -------------------------------------------------------------------------- */

void Ascrp_clear(const char *ext)
{
	char path[__PS__] = "A:\\";
	char filename[__PS__];
	char fileext[__PS__];
	A_FileList *ptr;
	A_FileList *list;
	
	list = NULL;
	if (ACSblk->scrp_path[0] != '\0')
	{
		Amo_busy();
		path[0] += Af_2drv(ACSblk->scrp_path);
		Af_2path(&path[2], ACSblk->scrp_path);
		ptr = list = Af_readdir(path);
		if (ptr != NULL)
		{
			while (ptr != NULL)
			{
				Ast_toupper(Af_2name(filename, ptr->file));
				Af_2ext(fileext, ptr->file);
				if (stricmp(filename, "SCRAP") == 0)
				{
					if (ext == NULL || *ext == '\0')
					{
						if (Fdelete(ptr->file) != 0)
							break;
					} else
					{
						if (strcmp(fileext, ext) == 0 && Fdelete(ptr->file) != 0)
							break;
					}
				}
				ptr = ptr->next;
			}
			Af_freedir(list);
			scrp_chg(path[0] - 'A');
		}
		Amo_unbusy();
	}
}

/* -------------------------------------------------------------------------- */

boolean Ascrp_get(char *ext, void **buffer, ssize_t *len)
{
	char path[__PS__] = "A:\\";
	char filename[__PS__];
	char fileext[__PS__];
	long fd;
	A_FileList *ptr;
	A_FileList *list;
	boolean retcode;
	
	list = NULL;
	retcode = FALSE;
	
	if (ACSblk->scrp_path[0] != '\0')
	{
		Amo_busy();
		if (ext != NULL)
			Ast_toupper(ext);
		path[0] += Af_2drv(ACSblk->scrp_path);
		Af_2path(&path[2], ACSblk->scrp_path);
		ptr = list = Af_readdir(path);
		if (ptr != NULL)
		{
			while (ptr != NULL)
			{
				Ast_toupper(Af_2name(filename, ptr->file));
				Ast_toupper(Af_2ext(fileext, ptr->file));
				if (Ast_icmp(filename, "SCRAP") == 0)
				{
					if (ext == NULL || *ext == '\0' || *ext == '*')
					{
						break;
					} else
					{
						if (Ast_icmp(fileext, ext) == 0)
							break;
					}
				}
				ptr = ptr->next;
			}
			
			if (ptr != NULL)
			{
				*len = Af_length(ptr->file);
				if (buffer == NULL)
				{
					retcode = TRUE;
				} else
				{
					*buffer = Ax_malloc(*len + 1);
					if (*buffer != NULL)
					{
						fd = Fopen(ptr->file, FO_READ);
						if (fd < 0)
						{
							Ax_free(*buffer);
						} else
						{
							if (Fread((int)fd, *len, *buffer) != *len)
							{
								Ax_free(*buffer);
							} else
							{
								((char *)(*buffer))[*len] = '\0';
								retcode = TRUE;
							}
							Fclose((int)fd);
						}
					}
				}
				if (ext != NULL)
					Af_2ext(ext, ptr->file);
			}
			Af_freedir(list);
		}
		Amo_unbusy();
	}
	return retcode;
}

/* -------------------------------------------------------------------------- */

boolean Ascrp_put(const char *ext, const void *buffer, long len, boolean append)
{
	char filename[__PS__];
	char path[__PS__];
	long fd;
	int32 filelen;
	boolean retcode = TRUE;
	
	if (ACSblk->scrp_path[0] != '\0' && *ext != '\0')
	{
		Af_buildname(filename, Af_2drv(ACSblk->scrp_path), Af_2path(path, ACSblk->scrp_path), "scrap", ext);
		Amo_busy();
		if ((filelen = Af_length(filename)) == -1)
		{
#if WITH_FIXES
			Amo_unbusy();
#endif
			return FALSE;
		}
		if (append)
		{
			if (filelen < 0)
			{
				if ((fd = Fcreate(filename, 0)) < 0)
					retcode = FALSE;
			} else
			{
				if ((fd = Fopen(filename, FO_RW)) < 0)
					retcode = FALSE;
				else if (Fseek(0, (int)fd, SEEK_END) != filelen)
					retcode = FALSE;
			}
		} else
		{
			if (filelen >= 0 && Fdelete(filename) != 0)
				retcode = FALSE;
			if ((fd = Fcreate(filename, 0)) < 0)
				retcode = FALSE;
		}
		if (retcode)
		{
			if (Fwrite((int)fd, len, buffer) != len)
			{
				Fclose((int)fd);
				Fdelete(filename);
				retcode = FALSE;
			} else
			{
				Fclose((int) fd);
				scrp_chg(filename[0] - 'A');
			}
		}
		Amo_unbusy();
	}
	return retcode;
}
