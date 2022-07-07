/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Userdef boxed editable field                          */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include <ctype.h>

#ifndef C_UNION
#  define C_UNION(x) { (int32)(x) }
#endif

typedef struct {
	char act[BE_MAXLEN + 1];
	char text[BE_MAXLEN + 1];
	char *mask;
	Awiob wiob;
	int16 len;
	int16 *pos;
	int16 *blklen;
	int16 prevpos;
	int16 prevblklen;
	int16 offset;
	int16 cw;
	int16 ch;
	int16 flags;
} EDT_DATA;

/* flags */
#define BE_CURSORMOVED       0x0001
#define BE_SELCHANGED        0x0002
#define BE_FULLUPDATE        0x0004
#define BE_DCLICK            0x0010

static OBJECT CHARLIST[] =  { { -1, -1, -1, G_BOX, 0, 0x0020, C_UNION(0x00ff1100L), 0, 0, 32, 16 } };
static OBJECT CHARENTRY[] = { { -1, -1, -1, G_BOXCHAR, 5, 0, C_UNION(0x00000170L), 0, 0, 2, 1 } };

static void boxed_delsel(OBJECT *entry, int16 pos, int16 len);
static boolean boxed_checktext(OBJECT *entry, const char *text, char *buf, int16 *plen);
static void boxed_postcheck(OBJECT *entry);
static void boxed_viewpos(OBJECT *entry, int16 pos);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void boxed_insert(OBJECT *entry, const char *text, boolean multiple)
{
	char *dst;
	char buf[BE_MAXLEN + 1];
	int16 stringlen;
	int16 blklen;
	int16 pos;
	int16 textlen;
	int16 insert;
	AUSERBLK *auser;
	EDT_DATA *data;
	Awindow *win;
	beparm *parm;
	
	pos = -1;
	auser = entry->ob_spec.auserblk;
	data = auser->ub_ptr2;
	win = data->wiob.window;
	parm = (beparm *)&auser->ub_parm;
	if (win != NULL && win->ob_edit == data->wiob.obnr)
	{
		pos = *data->pos;
		blklen = *data->blklen;
	}
	if (pos < 0)
	{
		pos = 0;
		blklen = data->len;
	}
	if (blklen > 0)
		boxed_delsel(entry, pos, blklen);
	textlen = parm->textlen;
	stringlen = (int)strlen(text);
	if (data->len + stringlen > textlen)
		stringlen = textlen - data->len;
	if (stringlen > 0 && boxed_checktext(entry, text, buf, &stringlen))
	{
		dst = &data->text[pos];
		insert = data->len - (pos + stringlen) + 1;
		if (insert <= 0)
		{
			strcpy(dst, buf);
		} else
		{
			while (insert >= 0)
			{
				dst[insert + stringlen] = dst[insert];
				insert--;
			}
			memcpy(dst, buf, stringlen);
		}
		if (win != NULL &&
			data->wiob.obnr == win->ob_edit &&
			*data->pos >= 0)
		{
			if (multiple)
			{
				*data->blklen = stringlen;
				memcpy(data->act, &data->text[*data->pos], stringlen);
				data->act[stringlen] = '\0';
			} else
			{
				strcpy(data->act, data->text);
				++(*data->pos);
			}
			data->len += stringlen;
			boxed_postcheck(entry);
			boxed_viewpos(entry, -1);
		} else
		{
			strcpy(data->act, data->text);
			data->len += stringlen;
			boxed_postcheck(entry);
		}
		data->flags |= BE_FULLUPDATE;
		if (win != NULL)
			win->service(win, AS_EDITCHG, NULL);
	}
}

/* -------------------------------------------------------------------------- */

static boolean boxed_within(unsigned char c, const char *ranges, const char *allowed)
{
	int16 i, count;
	
	i = 0;
	count = ((int)strlen(ranges)) >> 1;
	while (count > 0)
	{
		if (c >= ranges[i] && c <= ranges[i + 1])
			return TRUE;
		count--;
		i += 2;
	}
	if (allowed != NULL && strchr(allowed, c) != NULL)
		return TRUE;
	return FALSE;
}

/* -------------------------------------------------------------------------- */

static void boxed_findsep(const char *str, char c, const char **range)
{
	range[0] = range[1] = NULL;
	range[0] = strchr(str, c);
	if (range[0] != NULL)
		range[1] = strchr(range[0] + 1, c);
}

/* -------------------------------------------------------------------------- */

static boolean boxed_checktext(OBJECT *entry, const char *text, char *buf, int16 *plen)
{
	int16 pos;
	boolean alpha;
	int16 i;
	int16 len;
	boolean capital;
	int16 idx;
	char *ptr;
	const char *sep[2];
	char datesep;
	EDT_DATA *data;
	Awindow *win;
	AUSERBLK *auser;
	beparm *parm;
	
	pos = -1;
	alpha = FALSE;
	datesep = '\0';
	*buf = '\0';
	auser = entry->ob_spec.auserblk;
	data = auser->ub_ptr2;
	parm = (beparm *)&auser->ub_parm;
	win = data->wiob.window;
	if (win != NULL && win->ob_edit == data->wiob.obnr)
		pos = *data->pos;
	if (pos < 0)
		pos = data->len;
	if ((len = *plen) <= 0)
		return FALSE;
	capital = parm->capital != 0;
	ptr = buf;
	i = 0;
	if (data->mask != NULL)
	{
		while (i < len && strchr(data->mask, (unsigned char)text[i]) != NULL)
		{
			*ptr++ = text[i];
			i++;
		}
	} else
	{
		switch (parm->mask)
		{
		case BEM_ALL:
		case BEM_PATH:
			strncpy(ptr, &text[i], len - i);
			ptr += len - i;
			break;
		
		case BEM_FILE:
			while (i < len && strchr(":\\", (unsigned char)text[i]) == NULL)
			{
				*ptr++ = text[i];
				i++;
			}
			break;
		
		case BEM_TOSFILE:
			capital = TRUE;
			while (i < len && boxed_within(text[i], "azAZ09", "._!@#$%^&()+-=~';\",<>|[]{}"))
			{
				*ptr++ = text[i];
				i++;
			}
			break;
			
		case BEM_TOSFILESPEC:
			capital = TRUE;
			while (i < len && boxed_within(text[i], "azAZ09", "._!@#$%^&()+-=~';\",<>|[]{}*?"))
			{
				*ptr++ = text[i];
				i++;
			}
			break;

		case BEM_TOSPATH:
			capital = TRUE;
			while (i < len && boxed_within(text[i], "azAZ09", "._!@#$%^&()+-=~';\",<>|[]{}\\:"))
			{
				*ptr++ = text[i];
				i++;
			}
			break;

		case BEM_TOSPATHSPEC:
			capital = TRUE;
			while (i < len && boxed_within(text[i], "azAZ09", "._!@#$%^&()+-=~';\",<>|[]{}*?\\:"))
			{
				*ptr++ = text[i];
				i++;
			}
			break;
		
		case BEM_NORM:
			while (i < len && (unsigned char)text[i] >= ' ')
			{
				*ptr++ = text[i];
				i++;
			}
			break;
		
		case BEM_ALPHA:
			alpha = TRUE;
			/* fall through */
		case BEM_ALPHADIGIT:
			while (i < len && boxed_within(text[i], alpha ? "azAZ" : "azAZ09", " "))
			{
				*ptr++ = text[i];
				i++;
			}
			break;

		case BEM_NEGBIN:
			if (i == 0 && pos == 0 && text[i] == '-')
			{
				*ptr++ = text[i];
				i++;
			}
			/* fall through */
		case BEM_BIN:
			while (i < len && boxed_within(text[i], "01", NULL))
			{
				*ptr++ = text[i];
				i++;
			}
			break;

		case BEM_NEGOCT:
			if (i == 0 && pos == 0 && text[i] == '-')
			{
				*ptr++ = text[i];
				i++;
			}
			/* fall through */
		case BEM_OCT:
			while (i < len && boxed_within(text[i], "07", NULL))
			{
				*ptr++ = text[i];
				i++;
			}
			break;

		case BEM_NEGDEC:
			if (i == 0 && pos == 0 && text[i] == '-')
			{
				*ptr++ = text[i];
				i++;
			}
			/* fall through */
		case BEM_DEC:
			while (i < len && boxed_within(text[i], "09", NULL))
			{
				*ptr++ = text[i];
				i++;
			}
			break;

		case BEM_NEGHEX:
			if (i == 0 && pos == 0 && text[i] == '-')
			{
				*ptr++ = text[i];
				i++;
			}
			/* fall through */
		case BEM_HEX:
			capital = TRUE;
			while (i < len && boxed_within(text[i], "09afAF", NULL))
			{
				*ptr++ = text[i];
				i++;
			}
			break;

		case BEM_NEGFLOAT:
			if (i == 0 && pos == 0 && text[i] == '-')
			{
				*ptr++ = text[i];
				i++;
			}
			/* fall through */
		case BEM_FLOAT:
			sep[0] = strchr(data->text, '.');
			sep[1] = strchr(text, '.');
			while (i < len && boxed_within(text[i], "09", "."))
			{
				if (text[i] == '.')
				{
					if (sep[0] == NULL && &text[i] == sep[1])
						*ptr++ = text[i];
				} else
				{
					*ptr++ = text[i];
				}
				i++;
			}
			break;

		case BEM_DATEEURO:
		case BEM_DATEUS:
			datesep = '.';
			/* fall through */
		case BEM_DATEEURO_SEP:
		case BEM_DATEUS_SEP:
			if (datesep == '\0')
				datesep = '/';
			/* fall through */
		case BEM_TIME:
		case BEM_TIME12:
		case BEM_TIME24:
			if (datesep == '\0')
				datesep = ':';
			boxed_findsep(data->text, datesep, sep);
			while (i < len)
			{
				switch ((unsigned char)text[i])
				{
				case '.':
				case '/':
				case ':':
					if (text[i] == datesep)
					{
						for (idx = 0; idx < 2; idx++)
						{
							if (sep[idx] == NULL)
							{
								sep[idx] = &text[i];
								*ptr++ = datesep;
								break;
							}
						}
					}
					break;
				default:
					if (boxed_within(text[i], "09", NULL))
						*ptr++ = text[i];
					break;
				}
				i++;
			}
			break;
		}
	}

	buf[len] = *ptr = '\0';
	if (capital)
		Ast_toupper(buf);
	*plen = (int16)strlen(buf);
	if (*plen > 0)
		return TRUE;
	else
		return FALSE;
}

/* -------------------------------------------------------------------------- */

static long boxed_validate(const char *str, const char *end)
{
	long val = 0;
	
	if (end - 9 > str)
		end = str + 9;
	if (!isdigit(*str))
		return -1;
	while (str < end && isdigit(*str))
	{
		val *= 10;
		val += *str - '0';
		str++;
	}
	return val;
}

/* -------------------------------------------------------------------------- */

static void boxed_postcheck(OBJECT *entry)
{
	AUSERBLK *auser;
	EDT_DATA *data;
	beparm *parm;
	unsigned char datesep;
	const char *sep[2];
	char buf[BE_MAXLEN + 1] = "";
	long val1;
	long val2;
	long val3;
	long tmp;
	int16 len;
	
	val1 = -1;
	val2 = -1;
	val3 = -1;
	auser = entry->ob_spec.auserblk;
	data = auser->ub_ptr2;
	parm = (beparm *)&auser->ub_parm;
	switch (parm->mask)
	{
#if WITH_FIXES
	default:
		return; /* shut up compiler */
#endif
	case BEM_DATEEURO:
	case BEM_DATEUS:
		datesep = '.';
		break;
	case BEM_DATEEURO_SEP:
	case BEM_DATEUS_SEP:
		datesep = '/';
		break;
	case BEM_TIME:
	case BEM_TIME12:
	case BEM_TIME24:
		datesep = ':';
		/* break; */
	}
	if (parm->mask >= BEM_DATEEURO && parm->mask <= BEM_TIME24)
	{
		boxed_findsep(data->text, datesep, sep);
		val1 = boxed_validate(data->text, sep[0] != NULL ? sep[0] : &data->text[data->len]);
		if (sep[0] != NULL)
		{
			val2 = boxed_validate(sep[0] + 1, sep[1] != NULL ? sep[1] : &data->text[data->len]);
			if (sep[1] != NULL)
				val3 = boxed_validate(sep[1] + 1, &data->text[data->len]);
		}
#if WITH_FIXES
	} else
	{
		sep[0] = sep[1] = NULL; /* shut up compiler */
#endif
	}

	switch (parm->mask)
	{
	case BEM_DATEEURO:
	case BEM_DATEUS:
	case BEM_DATEEURO_SEP:
	case BEM_DATEUS_SEP:
		if (parm->mask == BEM_DATEUS || parm->mask == BEM_DATEUS_SEP)
		{
			tmp = val1;
			val1 = val2;
			val2 = tmp;
		}
		if (val2 > 12)
			val2 = 12;
		if (val2 > 0 && val3 >= 0)
		{
			if (val2 == 2)
			{
				len = (val3 % 400) == 0 || ((val3 % 4) == 0 && (val3 % 100) != 0) ? 29 : 28;
			} else
			{
				len = val2 > 7 ? (int16)val2 - 7 : (int16)val2;
				len = (len % 2) == 0 ? 30 : 31;
			}
		} else
		{
			len = 31;
		}
		if (val1 > len)
			val1 = len;
		if (parm->mask == BEM_DATEUS || parm->mask == BEM_DATEUS_SEP)
		{
			tmp = val1;
			val1 = val2;
			val2 = tmp;
		}
		break;

	case BEM_TIME12:
		if (val1 > 12)
			val1 = 12;
		/* fall through */

	case BEM_TIME24:
		if (val1 > 23)
			val1 = 23;
		/* fall through */

	case BEM_TIME:
		if (val2 > 59)
			val2 = 59;
		if (val3 > 59)
			val3 = 59;
		/* break; */
	}
	
	if (parm->mask >= BEM_DATEEURO && parm->mask <= BEM_TIME24)
	{
		len = 0;
		if (val1 >= 0)
			len = sprintf(buf, "%ld", val1);
		if (sep[0] != NULL)
			len += sprintf(&buf[len], "%c", datesep);
		if (val2 >= 0)
			len += sprintf(&buf[len], "%ld", val2);
		if (sep[1] != NULL)
			len += sprintf(&buf[len], "%c", datesep);
		if (val3 >= 0)
			len += sprintf(&buf[len], "%ld", val3);
		if (len > 0)
		{
			len = data->len - len;
			data->len -= len;
			if (data->pos != NULL)
				*data->pos -= len;
			if (data->blklen != NULL)
			{
				*data->blklen -= len;
				if (*data->blklen < 0)
					*data->blklen = 0;
			}
			strcpy(data->text, buf);
		}
	}
}

/* -------------------------------------------------------------------------- */

static void boxed_delsel(OBJECT *entry, int16 pos, int16 len)
{
	EDT_DATA *data;
	char *dst;
	Awindow *win;
	
	data = entry->ob_spec.auserblk->ub_ptr2;
	if (len > 0 && data->len > 0 && pos >= 0 && pos + len <= data->len)
	{
		dst = &data->text[pos];
#if WITH_FIXES
		memmove(dst, &dst[len], strlen(&dst[len]) + 1);
#else
		strcpy(dst, &dst[len]);
#endif
		data->len -= len;
		if (data->blklen != NULL)
			*data->blklen = 0;
		if (data->blklen != NULL)
			*data->pos = pos;
		data->flags |= BE_FULLUPDATE;
		strcpy(data->act, data->text);
		win = data->wiob.window;
		if (win != NULL)
			win->service(win, AS_EDITCHG, NULL);
	}
}

/* -------------------------------------------------------------------------- */

static void boxed_viewpos(OBJECT *entry, int16 pos)
{
	int16 tmp;
	int16 offset;
	int16 numchars;
	int16 i;
	EDT_DATA *data;
	OBJECT *tree;
	Awindow *win;
	
	data = entry->ob_spec.auserblk->ub_ptr2;
	offset = data->offset;
	win = data->wiob.window;
	if (data->wiob.obnr & A_TOOLBAR)
		tree = win->toolbar;
	else
		tree = win->work;
	numchars = tree[data->wiob.obnr & A_MASK].ob_width / data->cw;
	i = pos;
	if (i < 0)
		i = *data->pos;
	if (i > data->len)
		i = data->len;
	if (i > 0 && i - 1 < offset)
	{
		offset = i - 1;
	} else
	{
		tmp = i - offset - numchars + 1;
		if (tmp > 0 || i < offset)
			offset += tmp;
	}
	tmp = offset + numchars - data->len;
	if (tmp > 0)
		offset -= tmp;
	if (offset < 0)
		offset = 0;
	if (data->offset != offset)
		data->flags |= BE_FULLUPDATE;
	data->offset = offset;
}

/* -------------------------------------------------------------------------- */

static void boxed_charlist(OBJECT *entry)
{
	OBJECT *tree;
	OBJECT *ptr;
	int16 i;
	int16 len;
	char text[] = " ";
	char buf[] = " ";
	
	ptr = tree = Ax_malloc(257 * sizeof(*tree));
	if (tree == NULL)
		return;
	memcpy(ptr, CHARLIST, sizeof(*ptr));
	ptr->ob_head = 1;
	ptr->ob_tail = 256;
	ptr++;
	for (i = 0; i < 256; ptr++, i++)
	{
		memcpy(ptr, CHARENTRY, sizeof(*ptr));
		ptr->ob_spec.obspec.character = (unsigned char)i;
		ptr->ob_next = i + 2;
		ptr->ob_x = (i % 16) * 2;
		ptr->ob_y = i / 16;
		text[0] = i;
		len = 1;
		if (!boxed_checktext(entry, text, buf, &len) || buf[0] != (char)i)
		{
			ptr->ob_state |= OS_DISABLED;
			ptr->ob_spec.obspec.textcol = G_WHITE;
			ptr->ob_spec.obspec.interiorcol = G_LWHITE;
		}
	}
	ptr--;
	ptr->ob_flags |= OF_LASTOB;
	ptr->ob_next = ROOT;
	Aob_fix(tree);
	len = Ame_popup(ACSblk->ev_window, tree, ACSblk->ev_mmox - (tree->ob_width >> 1), ACSblk->ev_mmoy - (tree->ob_height >> 1));
	if (len > 1)
	{
		text[0] = (unsigned char)(len - 1);
		boxed_insert(entry, text, FALSE);
	}
	Ax_free(tree);
}

/* -------------------------------------------------------------------------- */

void Aus_boxed(void)
{
	Aus_objboxed(ACSblk->ev_window, ACSblk->ev_object, ACSblk->ev_obnr);
}

/* -------------------------------------------------------------------------- */

void Aus_objboxed(Awindow *win, OBJECT *tree, int16 obnr)
{
	Awindow *topwin;
	OBJECT *obj;
	EDT_DATA *data;
	AUSERBLK *auser;
	Axywh rect[6];
	Awiob wiob;
	int16 i;
	int16 sel[2];
	int16 x;
	int16 mox;
	int16 moy;
	int16 top;
	int16 events;
	int16 eventmask;
	int16 timeout;
	int16 lastrect;
	int16 currrect;
	
	eventmask = MU_BUTTON | MU_M1;
	timeout = 100;
	currrect = 2;
	obj = &tree[obnr & A_MASK];
#if WITH_FIXES
	if ((char)obj->ob_type != G_USERDEF || (auser = obj->ob_spec.auserblk) == NULL || auser->ub_serv == NULL || (data = auser->ub_ptr2) == NULL)
		return;
#else
	auser = obj->ob_spec.auserblk;
	data = auser->ub_ptr2;
	if ((char)obj->ob_type != G_USERDEF || auser == NULL || auser->ub_serv == NULL || data == NULL)
		return;
#endif
	wind_get(0, WF_TOP, &top, NULL, NULL, NULL);
	topwin = Awi_wid(top);
	if (top <= 0 || topwin == NULL || topwin != win)
	{
		win->topped(win);
	} else
	{
		wiob.window = win;
		wiob.entry = obj;
		wiob.obnr = obnr;
		auser->ub_serv(obj, AUO_SELF, &wiob);
		if (win->ob_edit > 0 && win->ob_edit != obnr)
			Awi_diaend();
		win->ob_edit = obnr;
		Awi_diastart();
		if (win->ob_edit < 0)
			return;
		Amo_new(&ACSblk->description->mouse[MOUSE_TEXT_CRSR]);
		memset(rect, 0, sizeof(rect));
		Aob_offset(&rect[2], tree, obnr & A_MASK);
		rect[2].x += win->wi_work.x;
		rect[2].y += win->wi_work.y;
		for (i = 0; i < 6; i++)
		{
			rect[i].y = 0;
			rect[i].h = ACSblk->desk.y + ACSblk->desk.h;
		}
		x = rect[2].x;
		if (rect[2].w > ACSblk->gl_wbox * 2)
		{
			rect[2].x += ACSblk->gl_wbox;
			rect[2].w -= ACSblk->gl_wbox * 2;
		}
		rect[1].w = rect[3].w = ACSblk->gl_wbox * 2;
		rect[0].w = rect[1].x = rect[2].x - rect[1].w;
		rect[3].x = rect[2].x + rect[2].w;
		rect[4].x = rect[3].x + rect[3].w;
		rect[4].w = ACSblk->desk.w - rect[4].x;
		rect[5].w = data->cw;
		mox = ACSblk->ev_mmox;
		sel[0] = sel[1] = (mox - x) / data->cw + data->offset;
		auser->ub_serv(obj, AUO_POS, &sel[0]);
		auser->ub_serv(obj, AUO_UPDATE, NULL);
		if (obj->ob_state & AOS_DCLICK)
		{
			sel[1] = sel[0];
			data->flags |= BE_DCLICK;
			auser->ub_serv(obj, AUO_BESETSELECT, sel);
			auser->ub_serv(obj, AUO_UPDATE, NULL);
		}
		
		while (TRUE)
		{
			if (currrect == 2)
			{
				rect[5].x = ((mox - x) / data->cw) * data->cw + x;
				lastrect = 5;
			} else
			{
				lastrect = currrect;
			}
#ifdef __PUREC__ /* only to get identical binary */
			events = mt_evnt_multi(eventmask, 1, ACSblk->ev_mmobutton, 0,
				1, rect[lastrect].x, rect[lastrect].y, rect[lastrect].w, rect[lastrect].h,
				0, 0, 0, 0, 0,
				NULL,
				(0L << 16) | timeout,
				&mox, &moy, &i, &i, &i, &i, _globl);
#else
			events = evnt_multi(eventmask, 1, ACSblk->ev_mmobutton, 0,
				1, rect[lastrect].x, rect[lastrect].y, rect[lastrect].w, rect[lastrect].h,
				0, 0, 0, 0, 0,
				NULL,
				timeout, 0,
				&mox, &moy, &i, &i, &i, &i);
#endif

			if (events & MU_BUTTON)
				break;
			
			if (events & MU_M1)
			{
				if (Aob_within(&rect[2], mox, moy))
					currrect = 2;
				else if (Aob_within(&rect[1], mox, moy))
					currrect = 1;
				else if (Aob_within(&rect[0], mox, moy))
					currrect = 0;
				else if (Aob_within(&rect[3], mox, moy))
					currrect = 3;
				else
					currrect = 4;
			}
			
			eventmask |= MU_TIMER;
			switch (currrect)
			{
			case 0:
				sel[1]--;
				timeout = 30;
				break;
			case 1:
				sel[1]--;
				timeout = 100;
				break;
			case 2:
				sel[1] = ((mox - x) / data->cw) + data->offset;
				eventmask &= ~MU_TIMER;
				break;
			case 3:
				sel[1]++;
				timeout = 100;
				break;
			case 4:
				sel[1]++;
				timeout = 30;
				break;
			}
			if (sel[1] < 0)
				sel[1] = 0;
			auser->ub_serv(obj, AUO_BESETSELECT, sel);
			auser->ub_serv(obj, AUO_UPDATE, NULL);
		}
		data->flags &= ~BE_DCLICK;
		Amo_new(&ACSblk->description->mouse[MOUSE_TEXT_CRSR]);
	}
}

/* -------------------------------------------------------------------------- */

boolean Auo_boxed(OBJECT *entry, int16 task, void *in_out)
{
	EDT_DATA *data;
	OBJECT *tree;
	AUSERBLK *auser;
	Awindow *win;
	Axywh rect;
	Axywh area;
	Awiob *wiob;
	int16 i;
	int16 *sel;
	int16 dummy;
	int16 pos;
	int16 posend;
	int16 blklen;
	int16 state;
	int16 flags;
	char *str;
	char *sep;
	beparm *parm;
	
	auser = entry->ob_spec.auserblk;
	parm = (beparm *)&auser->ub_parm;
	data = auser->ub_ptr2;
	if (task != AUO_CREATE)
		win = data->wiob.window;
	
	switch (task)
	{
	case AUO_CREATE:
		str = auser->ub_ptr1;
		data = auser->ub_ptr2 = Ax_malloc(sizeof(*data));
		if (data == NULL)
			return FALSE;
		memset(data, 0, sizeof(*data));
		auser->ub_ptr1 = data->act;
		if (parm->smallfont)
		{
			vst_font(ACSblk->vdi_handle, ACSblk->fontsid);
			vst_height(ACSblk->vdi_handle, ACSblk->fsheight, &dummy, &dummy, &data->cw, &data->ch);
		} else
		{
			vst_font(ACSblk->vdi_handle, ACSblk->fontid);
			vst_height(ACSblk->vdi_handle, ACSblk->fheight, &dummy, &dummy, &data->cw, &data->ch);
		}
		if (str != NULL)
			boxed_insert(entry, str, TRUE);
		data->flags = BE_FULLUPDATE;
		break;
	
	case AUO_SELF:
		wiob = in_out;
		data->wiob.window = wiob->window;
		data->wiob.entry = wiob->entry;
		data->wiob.obnr = wiob->obnr;
		data->pos = &wiob->window->ob_col;
		data->blklen = &wiob->window->ob_len;
		break;
	
	case AUO_OWNER:
		wiob = in_out;
		wiob->window = data->wiob.window;
		wiob->entry = data->wiob.entry;
		wiob->obnr = data->wiob.obnr;
		break;
	
	case AUO_TERM:
#if WITH_FIXES
		Ast_delete(data->mask);
#endif
		Ax_free(auser->ub_ptr2);
		break;
	
	case AUO_GETBUBBLE:
	case AUO_GETCONTEXT:
		break;
	
	case AUO_SETVAL:
		if (win == NULL || data->pos == NULL || data->blklen == NULL)
			return FALSE;
		*data->pos = 0;
		*data->blklen = data->len;
		boxed_insert(entry, in_out, TRUE);
		break;

	case AUO_GETVAL:
		if (win == NULL || data->pos == NULL || data->blklen == NULL)
			return FALSE;
		*((char **)in_out) = auser->ub_ptr1;
		break;
	
	case AUO_FULLUPDATE:
		data->flags |= BE_FULLUPDATE;
		/* fall through */
	case AUO_UPDATE:
		if (win == NULL || data->pos == NULL || data->blklen == NULL)
			return FALSE;
		blklen = *data->blklen;
		if (win->ob_edit == data->wiob.obnr && blklen > 0)
		{
			memcpy(data->act, &data->text[*data->pos], blklen);
			data->act[blklen] = '\0';
		} else
		{
			strcpy(data->act, data->text);
		}
		if ((data->flags & (BE_FULLUPDATE | BE_CURSORMOVED | BE_SELCHANGED)) != 0)
		{
			if (data->wiob.obnr & A_TOOLBAR)
				tree = win->toolbar;
			else
				tree = win->work;
			state = entry->ob_state;
			flags = entry->ob_flags;
			entry->ob_state &= ~(OS_OUTLINED | OS_SHADOWED);
			entry->ob_flags &= ~(OF_EDITABLE | AO_DEFABLE);
			Aob_offset(&rect, tree, data->wiob.obnr & A_MASK);
			entry->ob_state = state;
			entry->ob_flags = flags;
			rect.x += win->wi_work.x;
			rect.y += win->wi_work.y;
			area.y = rect.y;
			area.h = rect.h;
			if ((data->flags & (BE_FULLUPDATE | BE_CURSORMOVED | BE_SELCHANGED)) == BE_CURSORMOVED)
			{
				if (data->prevpos != *data->pos)
				{
					area.w = 1;
					if (data->prevpos >= 0)
					{
						area.x = (data->prevpos - data->offset) * data->cw + rect.x + 1;
						win->redraw(win, &area);
					}
					if (*data->pos >= 0)
					{
						area.x = (*data->pos - data->offset) * data->cw + rect.x + 1;
						win->redraw(win, &area);
					}
				}
			} else if ((data->flags & (BE_FULLUPDATE | BE_CURSORMOVED | BE_SELCHANGED)) == BE_SELCHANGED)
			{
				if (data->prevpos != *data->pos || data->prevblklen != *data->blklen)
				{
					pos = *data->pos < data->prevpos ? *data->pos : data->prevpos;
					blklen = *data->blklen > data->prevblklen ? *data->blklen : data->prevblklen;
					area.x = (pos - data->offset) * data->cw + rect.x;
					area.w = blklen * data->cw + 2;
					win->redraw(win, &area);
				}
			} else
			{
				data->wiob.window->obchange(data->wiob.window, data->wiob.obnr, -1);
			}
			data->flags &= ~(BE_FULLUPDATE | BE_CURSORMOVED | BE_SELCHANGED);
		}
		data->prevpos = *data->pos;
		data->prevblklen = *data->blklen;
		break;
	
	case AUO_BEINSCHAR:
		boxed_insert(entry, in_out, FALSE);
		break;
	
	case AUO_BEINSTEXT:
		boxed_insert(entry, in_out, TRUE);
		break;
	
	default:
		if (win->ob_edit != data->wiob.obnr || data->pos == NULL || data->blklen == NULL)
			return FALSE;
		switch (task)
		{
		case AUO_BEGIN:
			if (*data->blklen > 0)
				data->flags |= BE_FULLUPDATE;
			else
				data->flags |= BE_CURSORMOVED;
			*data->pos = 0;
			*data->blklen = 0;
			boxed_viewpos(entry, -1);
			break;
		
		case AUO_END:
			if (*data->blklen > 0)
				data->flags |= BE_FULLUPDATE;
			else
				data->flags |= BE_CURSORMOVED;
			*data->pos = data->len;
			*data->blklen = 0;
			boxed_viewpos(entry, -1);
			break;
		
		case AUO_POS:
			*data->pos = *((int16 *)in_out);
			if (*data->blklen > 0)
			{
				*data->blklen = 0;
				data->flags |= BE_FULLUPDATE;
			}
			if (*data->pos < 0 || *data->pos > data->len)
				*data->pos = data->len;
			data->flags |= BE_CURSORMOVED;
			boxed_viewpos(entry, -1);
			break;
		
		case AUO_BEINCWPOS:
			if (*data->blklen == 0)
			{
				if (*data->pos == data->len)
					break;
				str = data->text;
				for (i = *data->pos; i < data->len && strchr(ACSblk->separator, str[i]) == NULL; )
					i++;
				while (i < data->len && strchr(ACSblk->separator, str[i]) != NULL)
					i++;
				*data->pos = i;
				data->flags |= BE_CURSORMOVED;
				boxed_viewpos(entry, -1);
				break;
			}
			/* fall through */
		
		case AUO_BEINCPOS:
			if (*data->blklen > 0)
			{
				*data->pos += *data->blklen;
				*data->blklen = 0;
				data->flags |= BE_FULLUPDATE;
				boxed_viewpos(entry, -1);
			} else if (*data->pos < data->len)
			{
				*data->pos += 1;
				boxed_viewpos(entry, -1);
				data->flags |= BE_CURSORMOVED;
			}
			break;
		
		case AUO_BEDECWPOS:
			if (*data->blklen == 0)
			{
				if (*data->pos == 0)
					break;
				str = data->text;
				for (i = *data->pos - 1; i >= 0 && strchr(ACSblk->separator, str[i]) != NULL; )
					i--;
				while (i >= 0 && strchr(ACSblk->separator, str[i]) == NULL)
					i--;
				*data->pos = i + 1;
				data->flags |= BE_CURSORMOVED;
				boxed_viewpos(entry, -1);
				break;
			}
			/* fall through */
		
		case AUO_BEDECPOS:
			if (*data->blklen > 0)
			{
				*data->blklen = 0;
				data->flags |= BE_FULLUPDATE;
				boxed_viewpos(entry, -1);
			} else if (*data->pos > 0)
			{
				*data->pos -= 1;
				boxed_viewpos(entry, -1);
				data->flags |= BE_CURSORMOVED;
			}
			break;
		
		case AUO_BESETSELECT:
			sel = in_out;
			if (sel[0] < sel[1])
			{
				pos = sel[0];
				posend = sel[1];
			} else
			{
				pos = sel[1];
				posend = sel[0];
			}
			if (pos < 0)
			{
				posend = data->len;
				pos = 0;
			}
			if (posend > data->len)
				posend = data->len;
			if (pos > data->len)
				pos = data->len;
			if (data->flags & BE_DCLICK)
			{
				str = data->text;
				sep = strchr(ACSblk->separator, str[pos]);
				while (pos >= 0 && (sep != NULL ? strchr(ACSblk->separator, str[pos]) != NULL : strchr(ACSblk->separator, str[pos]) == NULL))
					pos--;
				pos++;
				sep = strchr(ACSblk->separator, str[posend]);
				while (posend < data->len && (sep != NULL ? strchr(ACSblk->separator, str[posend]) != NULL : strchr(ACSblk->separator, str[posend]) == NULL))
					posend++;
			}
			boxed_viewpos(entry, sel[1]);
			if (pos == posend)
			{
				*data->pos = pos;
				*data->blklen = 0;
			} else
			{
				*data->pos = pos;
				*data->blklen = posend - pos;
			}
			data->flags |= BE_SELCHANGED;
			break;
		
		case AUO_BEGETSELECT:
			sel = in_out;
			sel[0] = *data->pos;
			sel[1] = sel[0] + *data->blklen;
			break;
		
		case AUO_BEBSLINE:
			if (*data->blklen == 0)
			{
				*data->blklen = *data->pos;
				*data->pos = 0;
			}
			/* fall through */
		
		case AUO_BEBSW:
			if (*data->blklen == 0)
			{
				i = *data->pos - 1;
				str = data->text;
				sep = strchr(ACSblk->separator, str[i]);
				while (i >= 0 && (sep != NULL ? strchr(ACSblk->separator, str[i]) != NULL : strchr(ACSblk->separator, str[i]) == NULL))
					i--;
				i++;
				*data->blklen = *data->pos - i;
				*data->pos = i;
			}
			/* fall through */
			
		case AUO_BEBS:
			if (*data->blklen == 0 && *data->pos > 0)
			{
				*data->blklen += 1;
				*data->pos -= 1;
			}
			if (*data->blklen != 0)
			{
				boxed_delsel(entry, *data->pos, *data->blklen);
				boxed_viewpos(entry, -1);
			}
			break;
		
		case AUO_BEDELLINE:
			if (*data->blklen == 0)
				*data->blklen = data->len - *data->pos;
			/* fall through */
		
		case AUO_BEDELW:
			if (*data->blklen == 0)
			{
				i = *data->pos;
				str = data->text;
				sep = strchr(ACSblk->separator, str[i]);
				while (i < data->len && (sep != NULL ? strchr(ACSblk->separator, str[i]) != NULL : strchr(ACSblk->separator, str[i]) == NULL))
					i++;
				*data->blklen = i - *data->pos;
			}
			/* fall through */
		
		case AUO_BEDEL:
			if (*data->blklen == 0 && *data->pos < data->len)
			{
				*data->blklen += 1;
			}
			if (*data->blklen != 0)
			{
				boxed_delsel(entry, *data->pos, *data->blklen);
				boxed_viewpos(entry, -1);
			}
			break;
		
		case AUO_BEDELALL:
			boxed_delsel(entry, 0, data->len);
			boxed_viewpos(entry, -1);
			break;
		
		case AUO_BEMASK:
			if (data->mask != NULL)
			{
				Ast_delete(data->mask);
				data->mask = NULL;
			}
			str = (char *)in_out;
			if (str != NULL)
				data->mask = Ast_create(str);
			break;
		
		case AUO_BECHARLIST:
			boxed_charlist(entry);
			break;
		
		default:
			return FALSE;
		}
		break;
	}
	return TRUE;
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 CDECL A_boxed(PARMBLK *pb)
{
	EDT_DATA *data;
	OBJECT *obj;
	Awindow *win;
	AUSERBLK *auser;
	int16 pxy[4];
	int16 clip[4];
	int16 color;
	int16 dummy;
	int16 width;
	int16 numchars;
	int16 lines[10];
	int16 offset;
	int16 col;
	beparm *parm;
	char *textend;
	char *textptr;
	char savec;
	char text[BE_MAXLEN + 1]; /* FIXME: large array may overflow AES stack */
#if !WITH_FIXES
	char str[BE_MAXLEN + 1];
#endif
	
	textend = NULL;
	if (pb->pb_wc != 0 || pb->pb_hc != 0)
	{
		clip[0] = pb->pb_xc;
		clip[2] = clip[0] + pb->pb_wc - 1;
		clip[1] = pb->pb_yc;
		clip[3] = clip[1] + pb->pb_hc - 1;
		vs_clip(ACSblk->vdi_handle, TRUE, clip);
	} else
	{
		vs_clip(ACSblk->vdi_handle, FALSE, clip);
	}
	
	parm = (beparm *)&pb->pb_parm;
	obj = &pb->pb_tree[pb->pb_obj];
	auser = obj->ob_spec.auserblk;
	data = auser->ub_ptr2;
	win = data->wiob.window;
	if (win != NULL && win->ob_edit == data->wiob.obnr)
	{
		col = win->ob_col;
		offset = data->offset;
	} else
	{
		col = -1;
		offset = 0;
	}
	numchars = pb->pb_w / data->cw;
	if (parm->textlen < numchars)
		numchars = parm->textlen;
	width = numchars * data->cw;
	pxy[0] = pb->pb_x - 1;
	pxy[2] = pxy[0] + width + 1;
	pxy[1] = ((pb->pb_h - data->ch) >> 1) + pb->pb_y - 1;
	pxy[3] = pxy[1] + data->ch;
	
	vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
	vsl_width(ACSblk->vdi_handle, 1);
	vsl_ends(ACSblk->vdi_handle, 0, 0);
	vsl_type(ACSblk->vdi_handle, LT_SOLID);
	vst_effects(ACSblk->vdi_handle, TF_NORMAL);
	if (parm->smallfont)
	{
		vst_font(ACSblk->vdi_handle, ACSblk->fontsid);
		vst_height(ACSblk->vdi_handle, ACSblk->fsheight, &dummy, &dummy, &dummy, &dummy);
	} else
	{
		vst_font(ACSblk->vdi_handle, ACSblk->fontid);
		vst_height(ACSblk->vdi_handle, ACSblk->fheight, &dummy, &dummy, &dummy, &dummy);
	}
	vsf_interior(ACSblk->vdi_handle, FIS_HOLLOW);
	vsf_perimeter(ACSblk->vdi_handle, FALSE);
#if WITH_FIXES
	vsf_color(ACSblk->vdi_handle, G_WHITE);
#endif
	v_bar(ACSblk->vdi_handle, pxy);
	if (obj->ob_state & OS_OUTLINED)
	{
		if (parm->threedim != 0 && ACSblk->nplanes >= 4 && !(ACSblk->description->flags & AB_NO3D))
		{
			color = parm->upcol;
			dummy = parm->downcol;
		} else
		{
			color = dummy = G_BLACK;
		}
		lines[8] = lines[0] = pxy[2] + 1;
		lines[9] = lines[1] = pxy[1] - 1;
		lines[2] = pxy[2] + 1;
		lines[3] = pxy[3] + 1;
		lines[4] = pxy[0] - 1;
		lines[5] = pxy[3] + 1;
		lines[6] = pxy[0] - 1;
		lines[7] = pxy[1] - 1;
		vsl_color(ACSblk->vdi_handle, color);
		v_pline(ACSblk->vdi_handle, 3, &lines[4]);
		vsl_color(ACSblk->vdi_handle, dummy);
		v_pline(ACSblk->vdi_handle, 3, lines);
	}
	pxy[0] += 1;
	pxy[1] += 1;
	pxy[2] -= 2;
	pxy[3] -= 1;
	
	vst_color(ACSblk->vdi_handle, parm->textcol);
	vst_alignment(ACSblk->vdi_handle, TA_LEFT, TA_TOP, &dummy, &dummy);
	if (data->len != 0)
	{
		if (parm->secret != 0)
		{
			textptr = text;
			memset(text, '*', sizeof(text) - 1);
			text[data->len] = text[sizeof(text) - 1] = '\0';
		} else
		{
			textptr = &data->text[offset];
		}
		if (data->len - offset > numchars)
		{
			textend = &textptr[numchars];
			savec = *textend;
			*textend = '\0';
		}
#if !WITH_FIXES
		strcpy(str, textptr);
#endif
		v_gtext(ACSblk->vdi_handle, pb->pb_x, pxy[1], textptr);
		if (textend != NULL)
			*textend = savec;
	}
	
	dummy = numchars - data->len + offset;
	if (dummy > 0)
	{
		memset(text, '_', sizeof(text) - 1);
		text[dummy] = '\0';
		v_gtext(ACSblk->vdi_handle, (data->len - offset) * data->cw + pb->pb_x, pxy[1], text);
	}
	
	vsl_color(ACSblk->vdi_handle, G_BLACK);
	if (pb->pb_currstate & OS_SELECTED)
	{
		lines[6] = lines[8] = lines[0] = pb->pb_x - 1;
		lines[2] = lines[4] = lines[0] + width + 1;
		lines[3] = lines[9] = lines[1] = ((pb->pb_h - data->ch) >> 1) + pb->pb_y - 1;
		lines[7] = lines[5] = lines[1] + data->ch;
		v_pline(ACSblk->vdi_handle, 5, lines);
	}
	
	if (col >= 0)
	{
		vswr_mode(ACSblk->vdi_handle, MD_XOR);
		if (*data->blklen > 0)
		{
			vsf_interior(ACSblk->vdi_handle, FIS_SOLID);
			vsf_color(ACSblk->vdi_handle, G_BLACK);
			pxy[0] = (col - offset) * data->cw + pb->pb_x;
			pxy[2] = *data->blklen * data->cw + pxy[0] - 1;
			if (pxy[0] < pb->pb_x)
				pxy[0] = pb->pb_x;
			if (pxy[2] > pb->pb_x + width)
				pxy[2] = pb->pb_x + width;
			v_bar(ACSblk->vdi_handle, pxy);
		} else
		{
			pxy[0] = (col - offset) * data->cw + pb->pb_x;
			pxy[2] = pxy[0];
			if (pxy[0] >= pb->pb_x && pxy[0] <= pb->pb_x + pb->pb_w)
				v_pline(ACSblk->vdi_handle, 2, pxy);
		}
	}
	
	vs_clip(ACSblk->vdi_handle, FALSE, clip);
	return pb->pb_currstate & ~(OS_OUTLINED | OS_SELECTED);
}

/* -------------------------------------------------------------------------- */

void Aud_boxed(void)
{
	Awindow *win;
	int16 obnr;
	OBJECT *obj;
	AOBJECT *aobj;
	char *str;
	
	win = ACSblk->Aselect.window;
	str = NULL;
	Adr_start();
	obnr = Adr_next();
	while (obnr != -1)
	{
		if (obnr & A_TOOLBAR)
			obj = &win->toolbar[obnr & A_MASK];
		else
			obj = &win->work[obnr & A_MASK];
#if WITH_FIXES
		aobj = !(obj->ob_flags & OF_LASTOB) && (obj[1].ob_flags & AEO) ? (AOBJECT *)obj + 1 : NULL;
#else
		aobj = !(obj->ob_flags & OF_LASTOB) || (obj[1].ob_flags & AEO) ? (AOBJECT *)obj + 1 : NULL;
#endif
		if (aobj != NULL)
		{
			switch (aobj->type)
			{
			case AT_STRING:
				str = aobj->userp1;
				break;
			}
		}
		obnr = Adr_next();
	}
	
	if (str != NULL)
		Aob_service(ACSblk->ev_object, ACSblk->ev_obnr, AUO_SETVAL, str);
}
