/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Text editor userdef object                            */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "acsplus.h"
#include "country.h"

#if WITH_FIXES && COUNTRY != COUNTRY_DE
#  define NOTHING_FOUND "Nothing found."
#  define NO_PAREN "No parenthesis."
#else 
#  define NOTHING_FOUND "Nichts gefunden."
#  define NO_PAREN "Keine Klammer."
#endif


#define MAX_COLS     512

typedef struct {
	char *text;
	int16 size;
	int16 flags;
} EDITLINE;

/* EDITLINE.flags */
#define EDITLINE_SELECTED     0x0001
#define EDITLINE_INVERSE  0x0002

typedef struct {
	/*   0 */ int16 color;
	/*   2 */ int16 face;     /* font ID */
	/*   4 */ int16 cheight;  /* font size */
	/*   6 */ int16 height;
	/*   8 */ int16 width;
	/*  10 */ long row;       /* number of rows in window */
	/*  14 */ long col;
	/*  18 */ int16 flags;
	/*  20 */ long wrap;
	/*  24 */ long start_row;
	/*  28 */ long start_col;
	/*  32 */ long max_col;
	/*  36 */ long t_size;
	/*  40 */ long t_act;
	/*  44 */ EDITLINE *table;
	/*  48 */ long sel1row;
	/*  52 */ long sel1col;
	/*  56 */ long sel2row;
	/*  60 */ long sel2col;
	/*  64 */ long curv1;
	/*  68 */ long curv2;
	/*  72 */ int16 pheight;
	/*  74 */ int16 pwidth;
	/*  76 */ long orow;
	/*  80 */ long ocol;
	/*  84 */ Awiob self;
	/*  94 */ OBJECT *hor;
	/*  98 */ OBJECT *ver;
	/* 102 */ long single;
	/* 106 */ long till;
	/* 110 */ int16 wraps;
	/* 112 */ int16 select;
	/* 114 */ EDITLIVE live;
	/* 122 */ long cut1row;
	/* 126 */ long cut1col;
	/* 130 */ long cut2row;
	/* 134 */ long cut2col;
	/* 138 */ long ins2row;
	/* 142 */ long ins2col;
	/* 146 */ long nrow;
	/* 150 */ char **text;
	/* 154 */ int16 tabsize;
	/* 156 */ int16 cursor;
	/* 158 */ int16 err;
	/* 160 */ char separator[257];
	/* 418 */
} EDITTEXT;

/* EDITTEXT.flags */
#define EDITTEXT_NEEDS_RESIZE      0x0001
#define EDITTEXT_TILL              0x0002
#define EDITTEXT_SINGLE            0x0004
#define EDITTEXT_FULLUPDATE        0x0008
#define EDITTEXT_WRAP              0x0010
#define EDITTEXT_CURON             0x0020
#define EDITTEXT_CHANGECUR         0x0040
#define EDITTEXT_CURVIS            0x0080
#define EDITTEXT_INVERS            0x0100
#define EDITTEXT_HAS_SELECTION     0x0200
#define EDITTEXT_WORD              0x0400
#define EDITTEXT_NOCASE            0x0800
#define EDITTEXT_BACKWARD          0x1000
#define EDITTEXT_CHANGED           0x2000

/* EDITTEXT.select */
#define EDIT_SELECT_CHAR         0 /* select charmode */
#define EDIT_SELECT_01           1 /* select one or nothing */
#define EDIT_SELECT_1            2 /* select exactly one */
#define EDIT_SELECT_CONTINUES    3 /* select continous */
#define EDIT_SELECT_DISCONTINUES 4 /* select discontinous */
#define EDIT_SELECT_BLOCK        5 /* select blockchar mode */


static EDITTEXT proto = {
	G_BLACK,
	1,
	0,
	0,
	0,
	0,
	0,
	EDITTEXT_NEEDS_RESIZE,
	MAX_COLS,
	0,
	0,
	MAX_COLS,
	1,
	0,
	NULL,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	{ NULL, NULL, 0 },
	NULL,
	NULL,
	0,
	0,
	0,
	EDIT_SELECT_CHAR,
	{ NULL, NULL },
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	NULL,
	0,
	0,
	0,
	" \t=+-*/()!&|[]{}<>,.;:\335$%?`'^#~@\\\""
};

static char buffer[MAX_COLS * 2];
static char line[MAX_COLS + 2];

static void resize(OBJECT *obj);
static int16 editor_create(OBJECT *obj);
static int16 edit_expand(EDITTEXT *editor, long count);
static void edit_updateline(EDITTEXT *editor, long lineno);
static void edit_restart(EDITTEXT *editor);
static void edit_selrange(EDITTEXT *editor, long start, long end, int mode);
static void uedit_scroll(EDITTEXT *editor, int16 diffx, int16 diffy);
static void editor_cleanup(EDITTEXT *editor, boolean update);
static char *vertical(void *obj, long val);
static char *horizontal(void *obj, long val);


/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static char *untab(char *str, int16 tabsize, int16 len)
{
	char *src;
	char *dst;
	char c;
	int16 adv;
	
	if (len >= (int16)sizeof(buffer))
		len = (int16)sizeof(buffer) - 1;
	memset(buffer, ' ', len);
	buffer[len] = '\0';
	src = str;
	dst = buffer;
	if (str == NULL)
		return buffer;
	while (*src != '\0' && len-- != 0)
	{
		c = *src++;
		if (c == '\t')
		{
			adv = tabsize - ((int16)(dst - buffer) % tabsize);
			len -= adv - 1;
			dst += adv;
		} else
		{
			*dst++ = c;
		}
	}
	return buffer;
}

/* -------------------------------------------------------------------------- */

/*
 * convert a column number into a byte offset
 */
static int16 posv(const char *str, int16 tabsize, int16 len)
{
	int16 col;
	int16 offset;
	int16 adv;
	
	col = 0;
	offset = 0;
	if (str == NULL)
		return offset;
	while (*str != '\0' && col < len)
	{
		if (*str++ == '\t')
		{
			adv = tabsize - (col % tabsize);
			col += adv;
			if (col > len)
				break;
		} else
		{
			col++;
		}
		offset++;
	}
	return offset;
}

/* -------------------------------------------------------------------------- */

/*
 * convert a byte offset into a column number
 */
static int16 vpos(const char *str, int16 tabsize, int16 len)
{
	int16 col;
	int16 adv;
	
	col = 0;
	if (str == NULL)
		return col;
	while (*str != '\0' && len-- != 0)
	{
		if (*str++ == '\t')
		{
			adv = tabsize - (col % tabsize);
			col += adv;
		} else
		{
			col++;
		}
	}
	return col;
}

/* -------------------------------------------------------------------------- */

int16 CDECL A_editor(PARMBLK *pb)
{
	OBJECT *obj;
	AUSERBLK *auser;
	EDITTEXT *editor;
	int16 pxy[8];
	int16 sel[4];
	int16 x1;
	int16 y1;
	int16 x2;
	int16 y2;
	int16 yend;
	int16 y;
	int16 clipx1;
	int16 clipy1;
	int16 clipx2;
	int16 clipy2;
	int16 dummy;
	boolean all_lines;
	int16 curcol;
	long numrows;
	EDITLINE *lineptr;
	char *str;
	char *dst;
	int16 tabsize;
	long start_row;
	int16 i;
	int16 start_col;
	int16 remain;
	char c;
	
	obj = pb->pb_tree + pb->pb_obj;
	auser = obj->ob_spec.auserblk;
	editor = auser->ub_ptr1;
	if (editor == NULL)
		return pb->pb_currstate;
	if (editor->flags & EDITTEXT_NEEDS_RESIZE)
		resize(obj);
	all_lines = TRUE;
	if ((editor->flags & EDITTEXT_TILL) && (editor->flags & EDITTEXT_SINGLE))
		all_lines = FALSE;
	x2 = x1 = pb->pb_x;
	y1 = y2 = pb->pb_y;
	x2 += editor->pwidth - 1;
	y2 += editor->pheight - 1;

	clipx2 = clipx1 = pb->pb_xc;
	clipy2 = clipy1 = pb->pb_yc;
	if (clipx1 < x1)
		clipx1 = x1;
	if (clipy1 < y1)
		clipy1 = y1;
	clipx2 += pb->pb_wc - 1;
	clipy2 += pb->pb_hc - 1;
	if (clipx2 > x2)
		clipx2 = x2;
	if (clipy2 > y2)
		clipy2 = y2;
	if (clipx1 > clipx2 || clipy1 > clipy2)
		return pb->pb_currstate;
	
	pxy[0] = clipx1;
	pxy[1] = clipy1;
	pxy[2] = clipx2;
	pxy[3] = clipy2;
	vs_clip(ACSblk->vdi_handle, TRUE, pxy);
	
	tabsize = editor->tabsize;
	start_col = (int16)editor->start_col;

	vsf_interior(ACSblk->vdi_handle, FIS_SOLID);
	if (!(editor->flags & EDITTEXT_CHANGECUR))
	{
		vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
		vst_rotation(ACSblk->vdi_handle, 0);
		vst_font(ACSblk->vdi_handle, editor->face);
		vst_height(ACSblk->vdi_handle, editor->cheight, &dummy, &dummy, &dummy, &dummy);
		vst_color(ACSblk->vdi_handle, editor->color);
		vst_effects(ACSblk->vdi_handle, TF_NORMAL);
		vst_alignment(ACSblk->vdi_handle, TA_LEFT, TA_TOP, &dummy, &dummy);
		vsf_color(ACSblk->vdi_handle, G_WHITE);
		
		numrows = editor->row;
		start_row = editor->start_row;
		curcol = (int16)editor->col;
		lineptr = editor->table + start_row;
		
		y = clipy1 - editor->height;
		yend = clipy2 + 1;
		pxy[2] = pxy[6] = clipx2;
		while (y1 < yend)
		{
			if (y1 > y &&
				(all_lines || editor->single == start_row))
			{
				pxy[1] = pxy[5] = y1;
				pxy[3] = pxy[7] = y1 + editor->height - 1;
				
				if (editor->t_act >= start_row &&
					numrows > 0)
				{
					if (!(editor->flags & EDITTEXT_INVERS))
					{
						str = lineptr->text;
						if (str != NULL)
						{
							for (i = 0; i < start_col && *str != '\0'; )
							{
								if (*str++ == '\t')
									i += tabsize - i % tabsize;
								else
									i++;
							}
							remain = i - start_col;
						} else
						{
							remain = -1;
						}
						if (remain >= 0 && *str != '\0')
						{
							if (remain > 0)
								memset(line, ' ', remain);
							dst = line + remain;
							while (*str != '\0' && curcol > remain)
							{
								c = *str++;
								if (c == '\t')
								{
									i = tabsize - (remain + start_col) % tabsize;
									remain += i;
									while (i-- != 0)
										*dst++ = ' ';
								} else
								{
									remain++;
									*dst++ = c;
								}
							}
							*dst = '\0';
							v_gtext(ACSblk->vdi_handle, x1, y1, line);
							if (curcol > remain)
							{
								pxy[0] = remain * editor->width + x1;
								if (pxy[0] <= pxy[2])
									vr_recfl(ACSblk->vdi_handle, pxy);
							}
						} else
						{
							pxy[0] = clipx1;
							vr_recfl(ACSblk->vdi_handle, pxy);
						}
					}

					if (lineptr->flags & (EDITLINE_SELECTED | EDITLINE_INVERSE))
					{
						if ((lineptr->flags & EDITLINE_INVERSE) || !(editor->flags & EDITTEXT_INVERS))
						{
							if (editor->select == EDIT_SELECT_CHAR &&
								(editor->sel1row == start_row || editor->sel2row == start_row))
							{
								if (editor->flags & EDITTEXT_HAS_SELECTION)
								{
									if (editor->sel1row == start_row)
										pxy[0] = pxy[4] = (int16)((editor->curv1 - start_col) * editor->width + x1);
									else
										pxy[0] = pxy[4] = clipx1;
									if (editor->sel2row == start_row)
										pxy[2] = pxy[6] = (int16)((editor->curv2 - start_col) * editor->width + x1 - 1);
									if (pxy[0] <= pxy[2])
										vro_cpyfm(ACSblk->vdi_handle, NOT_D, pxy, &ACSblk->screenMFDB, &ACSblk->screenMFDB);
									pxy[2] = pxy[6] = clipx2;
								}
							} else
							{
								if (editor->select == EDIT_SELECT_BLOCK)
								{
									if (editor->flags & EDITTEXT_HAS_SELECTION)
									{
										pxy[0] = pxy[4] = (int16)((editor->curv1 - start_col) * editor->width + x1);
										pxy[2] = pxy[6] = (int16)((editor->curv2 - start_col) * editor->width + x1 - 1);
										if (pxy[0] <= pxy[2])
											vro_cpyfm(ACSblk->vdi_handle, NOT_D, pxy, &ACSblk->screenMFDB, &ACSblk->screenMFDB);
										pxy[2] = pxy[6] = clipx2;
									}
								} else
								{
									pxy[0] = pxy[4] = clipx1;
									vro_cpyfm(ACSblk->vdi_handle, NOT_D, pxy, &ACSblk->screenMFDB, &ACSblk->screenMFDB);
								}
							}
						}
					}
				} else
				{
					pxy[0] = clipx1;
					vr_recfl(ACSblk->vdi_handle, pxy);
				}
			}
			y1 += editor->height;
			lineptr++;
			start_row++;
			numrows--;
		}
	}
	
	if ((editor->flags & EDITTEXT_CURVIS) &&
		editor->sel1row < editor->start_row + editor->row &&
		editor->sel1row >= editor->start_row &&
		(all_lines || editor->single == editor->sel1row) &&
		!(editor->flags & EDITTEXT_HAS_SELECTION))
	{
		lineptr = editor->table + editor->sel1row;
		curcol = posv(lineptr->text, tabsize, (int16)editor->curv1);
		curcol = vpos(lineptr->text, tabsize, curcol);
		
		vswr_mode(ACSblk->vdi_handle, MD_XOR);
		vsf_color(ACSblk->vdi_handle, G_BLACK);
		sel[0] = (curcol - start_col) * editor->width + pb->pb_x;
		sel[1] = (int16)(editor->sel1row - editor->start_row) * editor->height + pb->pb_y;
		sel[2] = sel[0] + editor->width - 1;
		sel[3] = sel[1] + editor->height - 1;
		switch (editor->cursor)
		{
		case AUO_EDCURSOR_UNDERSCORE:
			sel[1] = sel[3] - 1;
			vr_recfl(ACSblk->vdi_handle, sel);
			break;
		case AUO_EDCURSOR_BLOCK:
			vr_recfl(ACSblk->vdi_handle, sel);
			break;
		case AUO_EDCURSOR_FRAME:
			vsf_perimeter(ACSblk->vdi_handle, TRUE);
			vsf_interior(ACSblk->vdi_handle, FIS_HOLLOW);
			v_bar(ACSblk->vdi_handle, sel);
			break;
		default: /* AUO_EDCURSOR_LINE */
			sel[2] = sel[0] + 1;
			vr_recfl(ACSblk->vdi_handle, sel);
			break;
		}
	}
	
	vs_clip(ACSblk->vdi_handle, FALSE, pxy);
	
	return pb->pb_currstate & ~(OS_DISABLED | OS_SELECTED);
}

/* -------------------------------------------------------------------------- */

static void edit_view(EDITTEXT *editor)
{
	long startrow;
	long endrow;
	long d2;
	long d3;
	
	startrow = editor->sel1row;
	endrow = editor->start_row + editor->row - 1;
	if (editor->t_act < endrow)
	{
		endrow = editor->t_act;
		editor->start_row = endrow - editor->row + 1;
		if (editor->start_row < 0)
			editor->start_row = 0;
	}
	d2 = editor->start_row - startrow;
	d3 = startrow - endrow;
	if (d2 > 0 || d3 > 0)
	{
		if (d2 > 0)
		{
			if (d2 > 2)
			{
				startrow -= editor->row >> 1;
			}
		} else
		{
			if (d3 > 2)
			{
				startrow -= editor->row >> 1;
			} else
			{
				startrow -= editor->row - 1;
			}
		}

		endrow = editor->t_act - editor->row + 1;
		if (startrow > endrow)
			startrow = endrow;
		if (startrow < 0)
			startrow = 0;
		editor->start_row = startrow;
	}
	
	d3 = editor->curv1;
	endrow = editor->start_col + editor->col;
	if (endrow > editor->max_col)
		endrow = editor->max_col;
	if (editor->start_col >= d3 || d3 >= endrow)
	{
		d3 -= (editor->col >> 1) + 1;
		endrow = editor->max_col - editor->col;
		if (d3 > endrow)
			d3 = endrow;
		if (d3 < 0)
			d3 = 0;
		if (editor->start_col != d3)
		{
			editor->flags |= EDITTEXT_FULLUPDATE;
			editor->start_col = d3;
		}
	}
}

/* -------------------------------------------------------------------------- */

static void edit_showcol(EDITTEXT *editor, long col)
{
	if (col > editor->max_col)
		col = editor->max_col;
	if (col < editor->start_col)
	{
		editor->start_col -= editor->col >> 2;
		if (editor->start_col < 0)
			editor->start_col = 0;
	} else
	{
		if (editor->start_col + editor->col <= col)
		{
			col = editor->col >> 2;
			editor->start_col += col;
			col = editor->max_col - editor->col;
			if (col < 0)
				col = 0;
			if (editor->start_col > col)
				editor->start_col = col;
		}
	}
}

/* -------------------------------------------------------------------------- */

static void edit_freeundo(char **list, long count)
{
	char **ptr;
	
	if (list != NULL)
	{
		ptr = list;
		while (count-- != 0)
			Ax_ifree(*ptr++);
		Ax_ifree(list);
	}
}

/* -------------------------------------------------------------------------- */

static char **edit_makeundo(EDITTEXT *editor, long start, long end)
{
	long count;
	char **list;
	char **ptr;
	EDITLINE *lineptr;
	
	count = end - start + 1;
	if (count <= 0)
		return NULL;
	ptr = Ax_malloc(count * sizeof(*list));
	if (ptr == NULL)
	{
		editor->err |= 1;
		return NULL;	
	}
	list = ptr;
	lineptr = editor->table + start;
	while (count--)
	{
		*ptr = lineptr->text;
		ptr++;
		lineptr++;
	}
	return list;
}

/* -------------------------------------------------------------------------- */

static int16 edit_movelines(EDITTEXT *editor, long start, long count)
{
	EDITLINE *lineptr;
	long copy;
	
	if (count > 0)
	{
		if (editor->t_act + count >= editor->t_size && edit_expand(editor, count) != OK)
			return FAIL;
		lineptr = editor->table + start;
		copy = editor->t_act + 1 - start;
		if (copy > 0)
			memmove(&lineptr[count], lineptr, copy * sizeof(*lineptr));
		editor->t_act += count;
	} else if (count < 0)
	{
		lineptr = editor->table + start;
		count = -count;
		copy = editor->t_act + 1 - start - count;
		editor->t_act -= count;
		if (copy > 0)
			memmove(lineptr, &lineptr[count], copy * sizeof(*lineptr));
		memset(editor->table + editor->t_act + 1, 0, count * sizeof(*lineptr));
		if (editor->t_act < 0)
			editor->t_act = 0;
	}
	return OK;
}

/* -------------------------------------------------------------------------- */

static void edit_insblk(EDITTEXT *editor, EDITSUBS *subs)
{
	long start;
	long lineno;
	char **text;
	ssize_t size;
	long nrow;
	long end;
	long count;
	long endrow;
	int16 col;
	int16 textlen;
	char **undos;
	int16 tabsize;
	int16 offset;
	int16 spaces;
	long i;
	EDITLINE *lineptr;
	const char *str;
	char *dst;
	
	start = subs->row1;
	end = start + subs->nrow - 1;
	count = end - editor->t_size + 1;
	if (count > 0 && edit_expand(editor, count) != OK)
		return;
	endrow = end;
	if (end > editor->t_act)
	{
		endrow = editor->t_act;
		editor->t_act = end;
	}
	nrow = endrow - start + 1;
	undos = edit_makeundo(editor, start, endrow);
	if (undos == NULL)
		return;
	edit_freeundo(editor->text, editor->nrow);
	editor->text = NULL;
	editor->nrow = 0;
	text = subs->text;
	textlen = (int16)strlen(*text);
	tabsize = editor->tabsize;
	col = vpos(editor->table[start].text, tabsize, (int16)subs->col1);
	for (lineno = start; lineno <= end; text++, lineno++)
	{
		lineptr = &editor->table[lineno];
		str = lineptr->text;
		if (str == NULL)
			str = "";
		offset = posv(str, tabsize, col);
		spaces = col - vpos(str, tabsize, offset);
		size = strlen(*text) + lineptr->size + spaces;
		dst = Ax_malloc(size + 1);
		if (dst != NULL)
		{
			strncpy(dst, str, offset);
			if (spaces != 0)
				memset(&dst[offset], ' ', spaces);
			strcpy(&dst[offset] + spaces, *text);
			strcat(&dst[offset] + spaces, &str[offset]);
		} else
		{
			editor->err |= 1;
			for (i = start; i <= lineno; i++)
			{
				lineptr = editor->table + i;
				Ax_ifree(lineptr->text);
				lineptr->text = undos[i - start];
				if (lineptr->text != NULL)
					lineptr->size = (int16)strlen(lineptr->text) + 1;
				else
					lineptr->size = 0;
			}
			Ax_ifree(undos);
			return;
		}
		lineptr->text = dst;
		lineptr->size = (int16)size;
		lineptr->flags = 0;
	}
	
	editor->text = undos;
	editor->nrow = nrow;
	editor->flags &= ~EDITTEXT_HAS_SELECTION;
	editor->flags |= EDITTEXT_FULLUPDATE;
	editor->cut1row = start;
	editor->cut2row = endrow;
	editor->cut2col = editor->cut1col = subs->col1;
	editor->ins2row = end;
	editor->ins2col = textlen + subs->col1;
	editor->sel1row = start;
	editor->sel1col = editor->ins2col;
	editor->curv1 = vpos(editor->table[start].text, tabsize, (int16)editor->sel1col);
}

/* -------------------------------------------------------------------------- */

static void edit_cutblk(EDITTEXT *editor, EDITSUBS *subs)
{
	char **undos;
	long nrow;
	int16 colstart;
	int16 colend;
	int16 tabsize;
	int16 tmp;
	long lineno;
	EDITLINE *lineptr;
	char *str;
	int16 offsetstart;
	int16 offsetend;
	long cut;
	long i;
	char *newtext;

	if (subs->col1 >= subs->col2)
	{
		edit_freeundo(subs->text, subs->nrow);
	} else
	{
		undos = edit_makeundo(editor, subs->row1, subs->row2);
		if (undos != NULL)
		{
			edit_freeundo(editor->text, editor->nrow);
			editor->text = NULL;
			editor->nrow = 0;
			nrow = subs->row2 - subs->row1 + 1;
			tabsize = editor->tabsize;
			colstart = vpos(editor->table[subs->row1].text, tabsize, (int16)subs->col1);
			colend = vpos(editor->table[subs->row2].text, tabsize, (int16)subs->col2);
			if (colstart > colend)
			{
				tmp = colstart;
				colstart = colend;
				colend = tmp;
			}
			for (lineno = subs->row1; lineno <= subs->row2; lineno++)
			{
				lineptr = editor->table + lineno;
				str = lineptr->text;
				if (str != NULL)
				{
					offsetstart = posv(str, tabsize, colstart);
					offsetend = posv(str, tabsize, colend);
					cut = offsetend - offsetstart;
					if (cut > 0)
					{
						cut = lineptr->size - cut;
						if (cut > 0)
						{
							newtext = Ax_malloc(cut + 1);
							if (newtext != NULL)
							{
								strncpy(newtext, str, offsetstart);
								strcpy(&newtext[offsetstart], &str[offsetend]);
							} else
							{
								for (i = subs->row1; i < lineno; i++)
								{
									lineptr = editor->table + i;
									Ax_ifree(lineptr->text);
									lineptr->text = undos[i - subs->row1];
									if (lineptr->text != NULL)
										lineptr->size = (int16)strlen(lineptr->text) + 1;
									else
										lineptr->size = 0;
								}
								Ax_ifree(undos);
								return;
							}
						} else
						{
							newtext = NULL;
						}
						lineptr->text = newtext;
						lineptr->size = (int16)cut;
						lineptr->flags = 0;
					}
				}
			}
			
			editor->cut1row = subs->row1;
			editor->sel1col = editor->ins2col = editor->cut1col = subs->col1;
			editor->ins2row = editor->cut2row = subs->row2;
			editor->cut2col = subs->col2;
			editor->curv1 = colstart;
			editor->text = undos;
			editor->nrow = nrow;
			editor->flags &= ~EDITTEXT_HAS_SELECTION;
			editor->flags |= EDITTEXT_FULLUPDATE;
		}
	}
}

/* -------------------------------------------------------------------------- */

static void edit_substitute(EDITTEXT *editor, EDITSUBS *subs)
{
	long lineno;
	long count;
	boolean blockmode;
	char **text;
	char **undos;
	EDITLINE lastline;
	long start;
	long nrow;
	EDITLINE *lineptr;
	char *dst;
	long col;
	long size;
	char *str;
	long linesdone;
	long i;
	
	editor->flags |= EDITTEXT_CHANGED;
	blockmode = FALSE;
	if (editor->select == EDIT_SELECT_BLOCK)
	{
		if (editor->flags & EDITTEXT_HAS_SELECTION)
			edit_selrange(editor, editor->sel1row, editor->sel2row, 0);
		if (subs->row1 == subs->row2 && subs->col1 == subs->col2)
		{
			if (subs->text[0][0] != '\0')
			{
				edit_insblk(editor, subs);
				return;
			}
		} else
		{
			if (subs->nrow == 1 && subs->text[0][0] == '\0')
			{
				edit_cutblk(editor, subs);
				return;
			}
			blockmode = TRUE;
			subs->row2 = subs->row1;
			subs->col2 = subs->col1;
		}
	}
	
	start = subs->row1;
	nrow = subs->row2 - start + 1;
	undos = edit_makeundo(editor, subs->row1, subs->row2);
	if (undos == NULL)
		return;
	edit_freeundo(editor->text, editor->nrow);
	editor->text = NULL;
	editor->nrow = 0;
	memcpy(&lastline, editor->table + subs->row2, sizeof(lastline));
	lineno = start + 1;
	count = subs->nrow - 1 - subs->row2 + start;
	if (edit_movelines(editor, lineno, count) != OK)
	{
		Ax_ifree(undos);
		return;
	}

	editor->flags &= ~EDITTEXT_HAS_SELECTION;
	editor->cut1row = subs->row1;
	editor->cut1col = subs->col1;
	editor->cut2row = subs->row2;
	editor->cut2col = subs->col2;
	text = subs->text;
	if (subs->nrow == 1)
	{
		if (nrow == 1 && !blockmode)
			edit_updateline(editor, start);
		else
			editor->flags |= EDITTEXT_FULLUPDATE;
		lineptr = editor->table + start;
		col = strlen(text[0]) + subs->col1;
		size = col - subs->col2 + lastline.size;
		if (size > 0)
		{
			if ((dst = Ax_malloc(size + 1)) != NULL)
			{
				if (lineptr->size > 0)
					strncpy(dst, lineptr->text, subs->col1);
				strcpy(&dst[subs->col1], text[0]);
				if (lastline.size > 0)
					strcat(&dst[subs->col1], lastline.text + subs->col2);
			} else
			{
				edit_movelines(editor, lineno, -count);
				Ax_ifree(undos);
				editor->flags |= EDITTEXT_FULLUPDATE;
				return;
			}
		} else
		{
			dst = NULL;
		}
		editor->sel1row = start;
		editor->sel1col = col;
		editor->curv1 = vpos(dst, editor->tabsize, (int16)col);
		lineptr->text = dst;
		lineptr->size = (int16)size;
		lineptr->flags = 0;
	} else
	{
		editor->flags |= EDITTEXT_FULLUPDATE;
		lineptr = editor->table + start;
		size = strlen(text[0]) + subs->col1;
		if (size > 0)
		{
			dst = Ax_malloc(size + 1);
			if (dst != NULL)
			{
				strncpy(dst, lineptr->text, subs->col1);
				strcpy(&dst[subs->col1], text[0]);
			} else
			{
				edit_movelines(editor, lineno, -count);
				Ax_ifree(undos);
				editor->flags |= EDITTEXT_FULLUPDATE;
				return;
			}
		} else
		{
			dst = NULL;
		}
		lineptr->text = dst;
		lineptr->size = (int16)size;
		lineptr->flags = 0;
		str = text[subs->nrow - 1];
		col = strlen(str);
		size = lastline.size + col - subs->col2;
		if (size > 0)
		{
			dst = Ax_malloc(size + 1);
			if (dst != NULL)
			{
				strcpy(dst, str);
				if (lastline.size > 0)
					strcat(dst, lastline.text + subs->col2);
			} else
			{
				linesdone = 1;
				goto error;
			}
		} else
		{
			dst = NULL;
		}
		editor->curv1 = vpos(dst, editor->tabsize, (int16)col);
		lineptr = editor->table + start - 1 + subs->nrow;
		lineptr->text = dst;
		lineptr->size = (int16)size;
		lineptr->flags = 0;
		linesdone = 1;
		while (subs->nrow - 1 > linesdone)
		{
			lineptr = editor->table + start + linesdone;
			str = text[linesdone];
			size = strlen(str);
			dst = Ast_create(str);
			if (dst == NULL)
				goto error;
			lineptr->text = dst;
			lineptr->size = (int16)size;
			lineptr->flags = 0;
			linesdone++;
		}
		editor->sel1col = col;
		editor->sel1row = start + subs->nrow - 1;
	}
	editor->ins2row = editor->sel1row;
	editor->ins2col = editor->sel1col;
	editor->text = undos;
	editor->nrow = nrow;
	return;

error:
	for (i = 0; i < linesdone; i++)
	{
		lineptr = editor->table + start + i;
		Ax_ifree(lineptr->text);
		if (i < nrow)
		{
			lineptr->text = undos[i];
			if (lineptr->text != NULL)
				lineptr->size = (int16)strlen(lineptr->text) + 1;
			else
				lineptr->size = 0;
		}
	}
	
	edit_movelines(editor, lineno, -count);
	Ax_ifree(undos);
	editor->flags |= EDITTEXT_FULLUPDATE;
}

/* -------------------------------------------------------------------------- */

static void edit_undo(EDITTEXT *editor)
{
	char **undos;
	long nrow;
	EDITLINE *lineptr;
	char **text;
	
	if (editor->text == NULL)
		return;
	undos = edit_makeundo(editor, editor->cut1row, editor->ins2row);
	if (undos == NULL)
		return;
	nrow = editor->cut2row - editor->ins2row;
	if (edit_movelines(editor, editor->cut1row, nrow) != OK)
		return; /* BUG: leaks undos allocated above */
	if (editor->flags & EDITTEXT_HAS_SELECTION)
		edit_selrange(editor, editor->sel1row, editor->sel2row, 0);
	lineptr = editor->table + editor->cut1row;
	nrow = editor->nrow;
	text = editor->text;
	while (nrow-- != 0)
	{
		lineptr->text = *text;
		if (*text != NULL)
			lineptr->size = (int16)strlen(*text);
		else
			lineptr->size = 0;
		lineptr->flags = EDITLINE_SELECTED;
		text++;
		lineptr++;
	}
	
	Ax_ifree(editor->text);
	editor->text = undos;
	editor->nrow = editor->ins2row - editor->cut1row + 1;
	editor->sel2row = editor->cut2row;
	editor->cut2row = editor->ins2row;
	editor->ins2row = editor->sel2row;
	editor->sel2col = editor->cut2col;
	editor->cut2col = editor->ins2col;
	editor->ins2col = editor->sel2col;
	editor->sel1row = editor->cut1row;
	editor->sel1col = editor->cut1col;
	editor->curv1 = vpos(editor->table[editor->sel1row].text, editor->tabsize, (int16)editor->sel1col);
	editor->curv2 = vpos(editor->table[editor->sel2row].text, editor->tabsize, (int16)editor->sel2col);
	
	if ((editor->select == EDIT_SELECT_BLOCK || editor->sel1row == editor->sel2row) &&
		editor->sel1col == editor->sel2col)
	{
		editor->flags |= EDITTEXT_FULLUPDATE;
		editor->flags &= ~EDITTEXT_HAS_SELECTION;
	} else
	{
		editor->flags |= EDITTEXT_FULLUPDATE | EDITTEXT_HAS_SELECTION;
	}
	edit_view(editor);
}

/* -------------------------------------------------------------------------- */

static void edit_updateline(EDITTEXT *editor, long lineno)
{
	if (editor->flags & EDITTEXT_SINGLE)
	{
		if (editor->single != lineno && editor->till != lineno)
		{
			if (editor->till + 1 == lineno && editor->start_row + editor->row == lineno)
				++editor->till;
			else
				editor->flags |= EDITTEXT_FULLUPDATE;
		}
	} else
	{
		editor->flags |= EDITTEXT_SINGLE;
		editor->single = lineno;
		editor->till = lineno;
	}
}

/* -------------------------------------------------------------------------- */

static void edit_showline(EDITTEXT *editor, long lineno)
{
	if (lineno < 0)
		lineno = 0;
	if (lineno > editor->t_act)
		lineno = editor->t_act;
	if (editor->start_row > lineno)
	{
		editor->start_row = lineno;
	} else if (editor->start_row + editor->row <= lineno)
	{
		editor->start_row = lineno - editor->row + 1;
	} else
	{
		edit_updateline(editor, lineno);
	}
}

/* -------------------------------------------------------------------------- */

static int16 edit_exmem(EDITTEXT *editor, long numlines)
{
	size_t size;
	EDITLINE *lineptr;
	
	size = numlines * sizeof(*lineptr);
	lineptr = Ax_malloc(size);
	if (lineptr == NULL)
	{
		editor->err |= 1;
		return FAIL;
	}
	memset(lineptr, 0, size);
	memcpy(lineptr, editor->table, editor->t_size * sizeof(*lineptr));
	Ax_ifree(editor->table);
	editor->table = lineptr;
	editor->t_size = numlines;
	return OK;
}

/* -------------------------------------------------------------------------- */

static int16 edit_expand(EDITTEXT *editor, long count)
{
	ssize_t avail;
	ssize_t size;
	
	avail = (ssize_t)Malloc(-1);
	count = editor->t_size + count + 511;
	count -= count % 512;
	size = count * sizeof(*editor->table);
	if (avail >= size)
	{
		if (((size >> 1) + size) < avail)
		{
			count += count >> 1;
		} else
		{
			count = avail / sizeof(*editor->table);
			count -= count % 512;
		}
	}
	return edit_exmem(editor, count);
}

/* -------------------------------------------------------------------------- */

static int16 edit_newline(OBJECT *obj)
{
	AUSERBLK *auser;
	EDITTEXT *editor;
	long wrap;
	EDITLINE *lineptr;
	size_t size;
	
	auser = obj->ob_spec.auserblk;
	editor = auser->ub_ptr1;
	if (editor->t_size <= editor->t_act + 1)
	{
		wrap = editor->wrap - editor->t_size;
		if (wrap > 0)
		{
			if (edit_exmem(editor, editor->wrap < editor->t_size + 25 ? editor->wrap : editor->t_size + 25) != OK)
				return FAIL;
			editor->t_act += 1;
		} else
		{
			if (editor->table->size != 0)
				Ax_ifree(editor->table->text);
			size = editor->t_act * sizeof(*editor->table);
			memmove(editor->table, editor->table + 1, size);
			lineptr = editor->table + editor->t_act;
			lineptr->text = NULL;
			lineptr->size = 0;
			lineptr->flags = 0;
			editor->single -= 1;
			editor->till -= 1;
			editor->wraps += 1;
			editor->flags |= EDITTEXT_WRAP;
		}
	} else
	{
		editor->t_act += 1;
	}
	edit_showline(editor, editor->t_act);
	return OK;
}

/* -------------------------------------------------------------------------- */

static void change_cur(EDITTEXT *editor)
{
	Awindow *win;
	
	win = editor->self.window;
	if (win != NULL)
	{
		editor->flags |= EDITTEXT_CHANGECUR;
		win->obchange(win, editor->self.obnr, -1);
		editor->flags &= ~EDITTEXT_CHANGECUR;
	}
}

/* -------------------------------------------------------------------------- */

static void edit_update(EDITTEXT *editor)
{
	Awindow *win;
	int16 obnr;
	int16 diffx, diffy;
	
	win = editor->self.window;
	if (win != NULL)
	{
		obnr = editor->self.obnr;
		if (Awi_obvisible(win, obnr))
		{
			diffx = (int16)(editor->start_col - editor->ocol) * editor->width;
			diffy = (int16)(editor->start_row - editor->orow) * editor->height;
			if ((editor->flags & EDITTEXT_FULLUPDATE) || win->wi_id < 0)
			{
				win->obchange(win, obnr, -1);
			} else
			{
				if (editor->flags & EDITTEXT_SINGLE)
				{
					if (editor->flags & EDITTEXT_WRAP)
					{
						diffy += editor->wraps * editor->height;
						editor->wraps = 0;
						uedit_scroll(editor, diffx, diffy);
					} else
					{
						if (diffx == 0 && diffy == 0)
						{
							if (editor->single == editor->till)
								editor->flags |= EDITTEXT_TILL;
							win->obchange(win, obnr, -1);
						} else
						{
							uedit_scroll(editor, diffx, diffy);
						}
					}
				} else
				{
					if (diffx != 0 || diffy != 0)
						uedit_scroll(editor, diffx, diffy);
				}
			}
			editor->flags &= ~(EDITTEXT_TILL | EDITTEXT_SINGLE | EDITTEXT_FULLUPDATE | EDITTEXT_WRAP);
			editor->orow = editor->start_row;
			editor->ocol = editor->start_col;
		}
	}
}

/* -------------------------------------------------------------------------- */

static void uedit_scroll(EDITTEXT *editor, int16 diffx, int16 diffy)
{
	int16 pxy[8];
	Awindow *win;
	OBJECT *tree;
	int16 wi_id;
	int16 obnr;
	int16 y;
	int16 h;
	int16 savex;
	int16 savey;
	Axywh rect;
	Axywh first;
	Axywh next;
	
	if (diffx != 0 || diffy != 0)
	{
		win = editor->self.window;
		wi_id = win->wi_id;
		if (wi_id >= 0)
		{
			if (win->state & AWS_MODAL)
			{
				memcpy(&first, &ACSblk->desk, sizeof(first));
				next.w = next.h = 0;
			} else
			{
				wind_get(wi_id, WF_FIRSTXYWH, &first.x, &first.y, &first.w, &first.h);
				if (first.w == 0 || first.h == 0)
					return;
				wind_get(wi_id, WF_NEXTXYWH, &next.x, &next.y, &next.w, &next.h);
			}
			obnr = editor->self.obnr;
			tree = editor->self.entry - obnr;
			objc_offset(tree, obnr, &rect.x, &rect.y);
			rect.x += win->wi_work.x;
			rect.y += win->wi_work.y;
			y = rect.y;
			rect.w = editor->pwidth;
			rect.h = editor->pheight;
			intersect(&rect, &first);
			intersect(&rect, &ACSblk->desk);
			h = 0;
			if (diffy > 0 && (editor->flags & EDITTEXT_SINGLE))
			{
				int16 yend = (int16)(editor->single - editor->start_row) * editor->height + y;
				if (yend < rect.y + rect.h)
					h = editor->height;
			}
			if (next.w != 0 || next.h != 0 ||
				rect.w <= diffx ||
				-diffx >= rect.w  ||
				diffy + h >= rect.h ||
				-diffy >= rect.h ||
				(diffy != 0 && diffx != 0))
			{
				win->obchange(win, obnr, -1);
			} else
			{
				pxy[0] = pxy[4] = rect.x;
				pxy[1] = pxy[5] = rect.y;
				pxy[2] = pxy[6] = rect.x + rect.w - 1;
				pxy[3] = pxy[7] = rect.y + rect.h - 1;
				if (diffx != 0)
				{
					if (diffx > 0)
					{
						pxy[0] += diffx;
						pxy[6] -= diffx;
						rect.x = pxy[6] + 1;
						rect.w = diffx;
					} else
					{
						pxy[2] += diffx;
						pxy[4] -= diffx;
						rect.w = -diffx;
					}
				}
				if (diffy != 0)
				{
					if (diffy > 0)
					{
						pxy[1] += diffy;
						pxy[7] -= diffy + h;
						pxy[3] -= h;
						rect.y = pxy[7] + 1;
						rect.h = diffy + h;
					} else
					{
						pxy[3] += diffy;
						pxy[5] -= diffy;
						rect.h = -diffy;
					}
				}
				vs_clip(ACSblk->vdi_handle, FALSE, pxy);
				
				savex = tree->ob_x;
				savey = tree->ob_y;
				tree->ob_x += win->wi_work.x;
				tree->ob_y += win->wi_work.y;
				graf_mouse(M_OFF, NULL);
				if (pxy[1] <= pxy[3])
					vro_cpyfm(ACSblk->vdi_handle, S_ONLY, pxy, &ACSblk->screenMFDB, &ACSblk->screenMFDB);
				objc_draw(tree, obnr, 0, rect.x, rect.y, rect.w, rect.h);
				graf_mouse(M_ON, NULL);
				tree->ob_x = savex;
				tree->ob_y = savey;
			}
		}
	}
}

/* -------------------------------------------------------------------------- */

static void edit_invers(EDITTEXT *editor, long lineno)
{
	int16 flags;
	long single;
	Awindow *win;
	
	if (editor->start_row <= lineno &&
		editor->start_row + editor->row > lineno)
	{
		flags = editor->flags;
		single = editor->single;
		editor->flags = EDITTEXT_HAS_SELECTION | EDITTEXT_INVERS | EDITTEXT_SINGLE;
		editor->single = lineno;
		editor->table[lineno].flags |= EDITLINE_INVERSE;
		win = editor->self.window;
		if (win != NULL)
		{
			win->obchange(win, editor->self.obnr, -1);
		}
		editor->table[lineno].flags &= ~EDITLINE_INVERSE;
		editor->single = single;
		editor->flags = flags;
	}
}

/* -------------------------------------------------------------------------- */

static long edit_col(EDITTEXT *editor, int16 mox)
{
	Awindow *win;
	OBJECT *tree;
	int16 y;
	int16 x;
	long lcol;
	
	win = editor->self.window;
	tree = editor->self.entry - editor->self.obnr;
	objc_offset(tree, editor->self.obnr, &x, &y);
	mox -= win->wi_work.x + x - (editor->width >> 1);
	lcol = mox / editor->width + editor->start_col;
	if (mox < 0)
		--lcol;
	if (lcol < 0)
		lcol = 0;
	if (lcol > editor->max_col)
		lcol = editor->max_col;
	return lcol;
}

/* -------------------------------------------------------------------------- */

static long edit_row(EDITTEXT *editor, int16 moy)
{
	Awindow *win;
	OBJECT *tree;
	int16 x;
	int16 y;
	long lrow;
	
	win = editor->self.window;
	tree = editor->self.entry - editor->self.obnr;
	objc_offset(tree, editor->self.obnr, &x, &y);
	moy -= win->wi_work.y + y;
	lrow = moy / editor->height + editor->start_row;
	if (moy < 0)
		--lrow;
	if (lrow < 0)
		lrow = 0;
	if (lrow > editor->t_act)
		lrow = editor->t_act;
	return lrow;
}

/* -------------------------------------------------------------------------- */

static void edit_1select(EDITTEXT *editor, int16 moy)
{
	int16 dummy;
	int16 button;
	long lrow;
	EDITLINE *lineptr;
	EDITLINE *selptr;
	const char *str;
	
	do
	{
		lrow = edit_row(editor, moy);
		lineptr = editor->table + lrow;
		if (!(lineptr->flags & EDITLINE_SELECTED))
		{
			selptr = editor->table + editor->sel1row;
			if (selptr->flags & EDITLINE_SELECTED)
			{
				edit_invers(editor, editor->sel1row);
				selptr->flags &= ~EDITLINE_SELECTED;
			}
			edit_invers(editor, lrow);
			lineptr->flags |= EDITLINE_SELECTED;
			editor->sel1row = lrow;
			editor->sel2row = lrow;
			editor->flags |= EDITTEXT_HAS_SELECTION;
			if (editor->live.call)
			{
				str = lineptr->text;
				if (str == NULL)
					str = "";
				editor->live.call(editor->live.obj, str);
			}
			if (lrow < editor->start_row || editor->start_row + editor->row <= lrow)
			{
				edit_showline(editor, lrow);
				edit_update(editor);
				editor_cleanup(editor, TRUE);
			}
		}
		graf_mkstate(&dummy, &moy, &button, &dummy);
	} while (button & 1);
}

/* -------------------------------------------------------------------------- */

static void edit_01select(EDITTEXT *editor, int16 moy)
{
	int16 dummy;
	int16 button;
	long lrow;
	EDITLINE *lineptr;
	
	lrow = edit_row(editor, moy);
	lineptr = editor->table + lrow;
	if (lineptr->flags & EDITLINE_SELECTED)
	{
		edit_invers(editor, lrow);
		lineptr->flags &= ~EDITLINE_SELECTED;
		editor->flags &= ~EDITTEXT_HAS_SELECTION;
		if (editor->live.call)
		{
			editor->live.call(editor->live.obj, "");
		}
		do
		{
			graf_mkstate(&dummy, &moy, &button, &dummy);
			if (!(button & 1))
				return;
		} while (edit_row(editor, moy) == lrow);
	}
	edit_1select(editor, moy);
}

/* -------------------------------------------------------------------------- */

static void edit_selrange(EDITTEXT *editor, long start, long end, int mode)
{
	long first, last;
	long i;
	int16 flags;
	boolean done;
	EDITLINE *lineptr;
	Awindow *win;
	
	first = editor->start_row;
	last = first + editor->row - 1;
	if (last > editor->t_act)
		last = editor->t_act;
	done = FALSE;
	for (i = start; i <= end; i++)
	{
		lineptr = editor->table + i;
		switch (mode)
		{
		case 0:
			if (lineptr->flags & EDITLINE_SELECTED)
			{
				lineptr->flags &= ~EDITLINE_SELECTED;
				if (i >= first && i <= last)
				{
					done = TRUE;
					lineptr->flags |= EDITLINE_INVERSE;
				}
			}
			break;
		case 1:
			if (!(lineptr->flags & EDITLINE_SELECTED))
			{
				lineptr->flags |= EDITLINE_SELECTED;
				if (i >= first && i <= last)
				{
					done = TRUE;
					lineptr->flags |= EDITLINE_INVERSE;
				}
			}
			break;
		case 2:
			if (i >= first && i <= last)
			{
				done = TRUE;
				lineptr->flags |= EDITLINE_INVERSE;
			}
			break;
		}
	}
	if (done)
	{
		win = editor->self.window;
		if (win != NULL)
		{
			flags = editor->flags;
			editor->flags = EDITTEXT_INVERS | EDITTEXT_HAS_SELECTION;
			win->obchange(win, editor->self.obnr, -1);
			editor->flags = flags;
		}
		for (i = first; i <= last; i++)
		{
			editor->table[i].flags &= ~EDITLINE_INVERSE;
		}
	}
}

/* -------------------------------------------------------------------------- */

static void edit_nselect(EDITTEXT *editor, int16 moy, int16 kstate, boolean deselect)
{
	int16 mode;
	long start;
	long lastsel;
	long newsel;
	int16 dummy;
	int16 button;
	
	if (!deselect)
		mode = 1;
	else
		mode = 0;
	if (kstate & K_SHIFT)
	{
		if (edit_row(editor, moy) > ((editor->sel1row + editor->sel2row) >> 1))
			start = editor->sel1row;
		else
			start = editor->sel2row;
	} else
	{
		edit_selrange(editor, editor->sel1row, editor->sel2row, mode);
		editor->sel1row = editor->sel2row = start = edit_row(editor, moy);
	}
	lastsel = -2;
	do
	{
		newsel = edit_row(editor, moy);
		if (newsel != lastsel)
		{
			if (newsel >= start)
			{
				if (newsel < editor->sel2row)
				{
					edit_selrange(editor, newsel + 1, editor->sel2row, mode);
				} else if (start < editor->sel2row)
				{
					edit_selrange(editor, editor->sel2row, newsel, deselect);
				} else
				{
					edit_selrange(editor, editor->sel1row, start - 1, mode);
					edit_selrange(editor, start, newsel, deselect);
				}
				editor->sel1row = start;
				editor->sel2row = newsel;
			} else
			{
				if (newsel > editor->sel1row)
				{
					edit_selrange(editor, editor->sel1row, newsel - 1, mode);
				} else if (start > editor->sel1row)
				{
					edit_selrange(editor, newsel, editor->sel1row, deselect);
				} else
				{
					edit_selrange(editor, start + 1, editor->sel2row, mode);
					edit_selrange(editor, newsel, start - 1, deselect);
				}
				editor->sel1row = newsel;
				editor->sel2row = start;
			}
			if (editor->start_row > newsel ||
				editor->start_row + editor->row <= newsel)
			{
				edit_showline(editor, newsel);
				edit_update(editor);
				editor_cleanup(editor, TRUE);
			}
			if (editor->live.call != NULL)
				editor->live.call(editor->live.obj, "");
		}
		lastsel = newsel;
		graf_mkstate(&dummy, &moy, &button, &dummy);
	} while (button & 1);
}

/* -------------------------------------------------------------------------- */

static void edit_nmselect(EDITTEXT *editor, int16 moy)
{
	editor->sel1row = editor->sel2row = edit_row(editor, moy);
	edit_nselect(editor, moy, 0, !(editor->table[editor->sel1row].flags & EDITLINE_SELECTED));
}

/* -------------------------------------------------------------------------- */

static int comp_rc(long row1, long col1, long row2, long col2)
{
	if (row1 > row2)
		return 1;
	if (row1 < row2)
		return -1;
	if (col1 > col2)
		return 1;
	if (col1 < col2)
		return -1;
	return 0;
}

/* -------------------------------------------------------------------------- */

static void edit_charselect(EDITTEXT *editor, int16 mox, int16 moy, int16 kstate)
{
	long lastrow;
	long lastcol;
	long newcol1;
	long startrow;
	long startcol;
	long startcurv;
	int16 dummy;
	int16 button;
	char *str;
	long newrow;
	long newcol;
	long newcurv;
	long selrow;
	
	startrow = edit_row(editor, moy);
	startcol = edit_col(editor, mox);
	str = editor->table[startrow].text;
	startcol = posv(str, editor->tabsize, (int16)startcol);
	if (kstate & K_SHIFT)
	{
		if (comp_rc(startrow, startcol, (editor->sel1row + editor->sel2row) >> 1, (editor->sel1col + editor->sel2col) >> 1) > 0)
		{
			startrow = editor->sel1row;
			startcol = editor->sel1col;
			startcurv = editor->curv1;
		} else
		{
			startrow = editor->sel2row;
			startcol = editor->sel2col;
			startcurv = editor->curv2;
		}
	} else
	{
		edit_selrange(editor, editor->sel1row, editor->sel2row, 0);
		editor->sel1row = editor->sel2row = startrow;
		editor->curv1 = editor->curv2 = startcurv = vpos(str, editor->tabsize, (int16)startcol);
	}
	lastrow = lastcol = -3;
	do
	{
		newrow = edit_row(editor, moy);
		newcol = newcol1 = edit_col(editor, mox);
		str = editor->table[newrow].text;
		newcol = posv(str, editor->tabsize, (int16)newcol);
		newcurv = vpos(str, editor->tabsize, (int16)newcol);

		if (lastrow != newrow || lastcol != newcol)
		{
			if (comp_rc(newrow, newcol, startrow, startcol) >= 0)
			{
				if (comp_rc(newrow, newcol, editor->sel2row, editor->sel2col) < 0)
				{
					editor->sel1row = newrow;
					editor->curv1 = newcurv;
					edit_selrange(editor, newrow, editor->sel2row, 0);
					editor->table[newrow].flags |= EDITLINE_SELECTED;
				} else if (comp_rc(startrow, startcol, editor->sel2row, editor->sel2col) < 0)
				{
					selrow = editor->sel2row;
					editor->sel1row = selrow;
					editor->curv1 = editor->curv2;
					editor->sel2row = newrow;
					editor->curv2 = newcurv;
					if (selrow != newrow || editor->curv1 < newcurv)
					{
						editor->table[selrow].flags &= ~EDITLINE_SELECTED;
						edit_selrange(editor, selrow, newrow, 1);
					} else
					{
						editor->sel2row = newrow;
					}
				} else if (comp_rc(newrow, newcol, editor->sel1row, editor->sel1col) > 0)
				{
					edit_selrange(editor, editor->sel1row, startrow, 0);
					editor->sel1row = startrow;
					editor->curv1 = startcurv;
					editor->sel2row = newrow;
					editor->curv2 = newcurv;
					edit_selrange(editor, startrow, newrow, 1);
				}
				editor->sel1row = startrow;
				editor->sel1col = startcol;
				editor->curv1 = startcurv;
				editor->sel2row = newrow;
				editor->sel2col = newcol;
				editor->curv2 = newcurv;
			} else
			{
				if (comp_rc(newrow, newcol, editor->sel1row, editor->sel1col) > 0)
				{
					editor->sel2row = newrow;
					editor->curv2 = newcurv;
					edit_selrange(editor, editor->sel1row, newrow, 0);
					editor->table[newrow].flags |= EDITLINE_SELECTED;
				} else if (comp_rc(startrow, startcol, editor->sel1row, editor->sel1col) > 0)
				{
					selrow = editor->sel1row;
					editor->sel2row = selrow;
					editor->curv2 = editor->curv1;
					editor->sel1row = newrow;
					editor->curv1 = newcurv;
					if (selrow != newrow)
					{
						editor->table[selrow].flags &= ~EDITLINE_SELECTED;
						edit_selrange(editor, newrow, selrow, 1);
					} else
					{
						long tmp = editor->curv2;
						if (newcurv < tmp)
						{
							editor->table[selrow].flags &= ~EDITLINE_SELECTED;
							edit_selrange(editor, newrow, selrow, 1);
						} else
						{
							editor->sel2row = newrow;
						}
					}
				} else
				{
					edit_selrange(editor, editor->sel1row, editor->sel2row, 0);
					editor->sel1row = newrow;
					editor->curv1 = newcurv;
					editor->sel2row = startrow;
					editor->curv2 = startcurv;
					edit_selrange(editor, newrow, startrow, 1);
				}
				editor->sel1row = newrow;
				editor->sel1col = newcol;
				editor->curv1 = newcurv;
				editor->sel2row = startrow;
				editor->sel2col = startcol;
				editor->curv2 = startcurv;
			}
			
		}
		
		if (editor->start_row > newrow ||
			editor->start_row + editor->row <= newrow ||
			newcol1 < editor->start_col ||
			newcol1 > editor->start_col + editor->col)
		{
			edit_showline(editor, newrow);
			edit_showcol(editor, newcol1);
			edit_update(editor);
			editor_cleanup(editor, TRUE);
		}
		/* FIXME: no live call here */

		lastrow = newrow;
		lastcol = newcol;
		graf_mkstate(&mox, &moy, &button, &dummy);
	} while (button & 1);
}

/* -------------------------------------------------------------------------- */

static void edit_blkselect(EDITTEXT *editor, int16 mox, int16 moy, int16 kstate)
{
	long startcol;
	long startrow;
	char *str;
	long lastrow;
	long lastcol;
	long newrow;
	long newcol;
	int16 dummy;
	int16 button;

	if (kstate & K_SHIFT)
	{
		if (edit_col(editor, mox) > ((editor->curv1 + editor->curv2) >> 1))
			startcol = editor->curv1;
		else
			startcol = editor->curv2;
		if (edit_row(editor, moy) > ((editor->sel1row + editor->sel2row) >> 1))
			startrow = editor->sel1row;
		else
			startrow = editor->sel2row;
	} else
	{
		edit_selrange(editor, editor->sel1row, editor->sel2row, 0);
		editor->sel1row = editor->sel2row = startrow = edit_row(editor, moy);
		str = editor->table[startrow].text;
		newcol = edit_col(editor, mox);
		newcol = posv(str, editor->tabsize, (int16)newcol);
		startcol = newcol = vpos(str, editor->tabsize, (int16)newcol);
		editor->curv1 = editor->curv2 = startcol;
		edit_selrange(editor, editor->sel1row, editor->sel2row, 1);
	}
	lastrow = lastcol = -2;
	do
	{
		newrow = edit_row(editor, moy);
		newcol = edit_col(editor, mox);
		str = editor->table[newrow].text;
		newcol = posv(str, editor->tabsize, (int16)newcol);
		newcol = vpos(str, editor->tabsize, (int16)newcol);
		if (newrow != lastrow || newcol != lastcol)
		{
			if (newcol >= startcol)
			{
				if (editor->curv2 > newcol)
				{
					editor->curv1 = newcol;
					edit_selrange(editor, editor->sel1row, editor->sel2row, 2);
				} else if (editor->curv2 > startcol)
				{
					editor->curv1 = editor->curv2;
					editor->curv2 = newcol;
					if (editor->curv1 <= newcol)
						edit_selrange(editor, editor->sel1row, editor->sel2row, 2);
				} else
				{
					if (editor->curv2 >= editor->curv1)
						edit_selrange(editor, editor->sel1row, editor->sel2row, 2);
					editor->curv1 = startcol;
					editor->curv2 = newcol;
					if (editor->curv1 <= newcol)
						edit_selrange(editor, editor->sel1row, editor->sel2row, 2);
				}
				editor->curv1 = startcol;
				editor->curv2 = newcol;
			} else
			{
				if (editor->curv1 <= newcol)
				{
					if (editor->curv1 < newcol)
					{
						editor->curv2 = newcol;
						edit_selrange(editor, editor->sel1row, editor->sel2row, 2);
					}
				} else if (editor->curv1 < startcol)
				{
					editor->curv2 = editor->curv1;
					editor->curv1 = newcol;
					edit_selrange(editor, editor->sel1row, editor->sel2row, 2);
				} else
				{
					if (editor->curv2 >= editor->curv1)
						edit_selrange(editor, editor->sel1row, editor->sel2row, 2);
					editor->curv1 = newcol;
					editor->curv2 = startcol;
					edit_selrange(editor, editor->sel1row, editor->sel2row, 2);
				}
				editor->curv1 = newcol;
				editor->curv2 = startcol;
			}
			
			if (newrow > startrow)
			{
				if (editor->sel2row > newrow)
				{
					edit_selrange(editor, newrow + 1, editor->sel2row, 0);
				} else if (editor->sel2row > startrow)
				{
					edit_selrange(editor, editor->sel2row, newrow, 1);
				} else
				{
					edit_selrange(editor, editor->sel1row, startrow - 1, 0);
					edit_selrange(editor, startrow, newrow, 1);
				}
				editor->sel1row = startrow;
				editor->sel2row = newrow;
			} else
			{
				if (editor->sel1row < newrow)
				{
					edit_selrange(editor, editor->sel1row, newrow - 1, 0);
				} else if (editor->sel1row < startrow)
				{
					edit_selrange(editor, newrow, editor->sel1row, 1);
				} else
				{
					edit_selrange(editor, startrow + 1, editor->sel2row, 0);
					edit_selrange(editor, newrow, startrow - 1, 1);
				}
				editor->sel1row = newrow;
				editor->sel2row = startrow;
			}
			
			if (editor->start_row > newrow ||
				editor->start_row + editor->row <= newrow ||
				newcol < editor->start_col ||
				newcol >= editor->start_col + editor->col)
			{
				edit_showline(editor, newrow);
				edit_showcol(editor, newcol);
				edit_update(editor);
				editor_cleanup(editor, TRUE);
			}
			/* FIXME: no live call here */
		}

		lastrow = newrow;
		lastcol = newcol;
		graf_mkstate(&mox, &moy, &button, &dummy);
	} while (button & 1);
	
	str = editor->table[editor->sel1row].text;
	editor->sel1col = posv(str, editor->tabsize, (int16)editor->curv1);
	str = editor->table[editor->sel2row].text;
	editor->sel2col = posv(str, editor->tabsize, (int16)editor->curv2);
}

/* -------------------------------------------------------------------------- */

static int16 edit_add(EDITTEXT *editor, long lineno, const char *str)
{
	int16 size;
	EDITLINE *lineptr;
	char *newstr;
	char *oldstr;
	
	if (editor->table == NULL)
		return FAIL;
	lineptr = editor->table + lineno;
	size = (int16)strlen(str) + lineptr->size;
	newstr = Ax_malloc(size + 1);
	if (newstr == NULL)
	{
		editor->err |= 1;
		return FAIL;
	}
	if (lineptr->size != 0)
	{
		oldstr = lineptr->text;
		lineptr->text = strcat(strcpy(newstr, oldstr), str);
		Ax_ifree(oldstr);
	} else
	{
		lineptr->text = strcpy(newstr, str);
	}
	lineptr->size = size;
	return OK;
}

/* -------------------------------------------------------------------------- */

static int16 edit_appline(OBJECT *obj, const char *str)
{
	AUSERBLK *auser;
	EDITTEXT *editor;

	auser = obj->ob_spec.auserblk;
	editor = auser->ub_ptr1;
	if (*str != '\0' && edit_add(editor, editor->t_act, str) != OK)
		return FAIL;
	edit_showline(editor, editor->t_act);
	return OK;
}

/* -------------------------------------------------------------------------- */

static void edit_free(EDITTEXT *editor)
{
	EDITLINE *lineptr;
	long count;
	
	lineptr = editor->table;
	for (count = editor->t_act; count >= 0; lineptr++, count--)
	{
		if (lineptr->size > 0)
			Ax_ifree(lineptr->text);
	}
	Ax_ifree(editor->table);
	edit_freeundo(editor->text, editor->nrow);
	editor->text = NULL;
	editor->nrow = 0;
	editor->sel1row =
	editor->sel2row =
	editor->sel1col =
	editor->sel2col =
	editor->curv1 =
	editor->curv2 = 0;
	editor->flags &= ~EDITTEXT_HAS_SELECTION;
}

/* -------------------------------------------------------------------------- */

static void resize(OBJECT *obj)
{
	AUSERBLK *auser;
	EDITTEXT *editor;
	long col;
	long row;
	
	auser = obj->ob_spec.auserblk;
	editor = auser->ub_ptr1;
	editor->row = obj->ob_height / editor->height;
	editor->col = obj->ob_width / editor->width;
	editor->pwidth = (int16)(editor->col * editor->width);
	editor->pheight = (int16)(editor->row * editor->height);
	editor->flags &= ~EDITTEXT_NEEDS_RESIZE;
	editor->flags |= EDITTEXT_FULLUPDATE;
	col = editor->max_col - editor->col;
	if (col < 0)
		col = 0;
	if (col < editor->start_col)
		editor->start_col = col;
	row = editor->t_act + 1 - editor->row;
	if (row < 0)
		row = 0;
	if (row < editor->start_row)
		editor->start_row = row;
}

/* -------------------------------------------------------------------------- */

static void edit_nextrange(EDITTEXT *editor, EDITSEL *info)
{
	long row;
	
	if (info->row1 < 0)
		return;
	row = info->row2 + 1;
	while (!(editor->table[row].flags & EDITLINE_SELECTED))
	{
		++row;
		if (row > editor->t_act)
		{
			info->row1 = -1;
			info->row2 = -1;
			return;
		}
	}
	info->row1 = row;
	while (row < editor->t_act && (editor->table[row + 1].flags & EDITLINE_SELECTED))
		row++;
	info->row2 = row;
}

/* -------------------------------------------------------------------------- */

static void edit_getrow(EDITTEXT *editor, EDITGETS *gets)
{
	EDITLINE *lineptr;
	long row;
	char *str;
	
	row = gets->row;
	if (row < 0 || row > editor->t_act)
	{
		gets->text = "";
		gets->size = -1;
		return;
	}
	lineptr = &editor->table[row];
	str = lineptr->text;
	if (str == NULL)
	{
		gets->text = "";
		gets->size = 0;
		return;
	}
	if (editor->flags & EDITTEXT_HAS_SELECTION)
	{
		if (editor->select == EDIT_SELECT_CHAR)
		{
			if (editor->sel1row == row)
			{
				gets->text = lineptr->text + editor->sel1col;
				if (editor->sel2row == row)
					gets->size = editor->sel2col - editor->sel1col;
				else
					gets->size = lineptr->size - editor->sel1col;
			} else if (editor->sel2row == row)
			{
				gets->text = lineptr->text;
				gets->size = editor->sel2col;
			} else
			{
				gets->text = lineptr->text;
				gets->size = lineptr->size;
			}
		} else if (editor->select == EDIT_SELECT_BLOCK)
		{
			gets->size = editor->curv2 - editor->curv1;
			gets->text = untab(lineptr->text, editor->tabsize, (int16)editor->curv2) + editor->curv1;
		} else
		{
			gets->text = lineptr->text;
			gets->size = lineptr->size;
		}
	} else
	{
		gets->text = lineptr->text;
		gets->size = lineptr->size;
	}
}

/* -------------------------------------------------------------------------- */

static void edit_unselect(EDITTEXT *editor)
{
	if (editor->select == EDIT_SELECT_DISCONTINUES)
		edit_selrange(editor, 0, editor->t_act, 0);
	else
		edit_selrange(editor, editor->sel1row, editor->sel2row, 0);
	if (editor->flags & EDITTEXT_HAS_SELECTION)
	{
		editor->flags &= ~EDITTEXT_HAS_SELECTION;
		if (editor->flags & EDITTEXT_CURVIS)
			change_cur(editor);
	}
}

/* -------------------------------------------------------------------------- */

static void edit_setselect(EDITTEXT *editor, EDITSEL *sel)
{
	if ((editor->flags & EDITTEXT_HAS_SELECTION) && editor->select != EDIT_SELECT_DISCONTINUES)
	{
		if (editor->sel1row == sel->row1 &&
			editor->sel1col == sel->col1 &&
			editor->sel2row == sel->row2 &&
			editor->sel2col == sel->col2)
			return;
		edit_selrange(editor, editor->sel1row, editor->sel2row, 0);
	}
	editor->sel1row = sel->row1;
	editor->sel1col = sel->col1;
	editor->curv1 = vpos(editor->table[editor->sel1row].text, editor->tabsize, (int16)editor->sel1col);
	editor->sel2row = sel->row2;
	editor->sel2col = sel->col2;
	editor->curv2 = vpos(editor->table[editor->sel2row].text, editor->tabsize, (int16)editor->sel2col);
	editor->flags |= EDITTEXT_HAS_SELECTION;
	edit_selrange(editor, editor->sel1row, editor->sel2row, 1);
}

/* -------------------------------------------------------------------------- */

static void edit_find(EDITTEXT *editor, const char *str)
{
	AUSERBLK *auser;
	long row;
	long offset;
	EDITLINE *lineptr;
	EDITSEL sel;
	long col;
	long lastrow;
	boolean charselect;
	boolean casesensitive;
	char c;
	char otherc;
	ssize_t searchlen;
	char *text;
	
	if (*str == '\0')
		return;
	auser = editor->self.entry->ob_spec.auserblk;
	auser->ub_serv(editor->self.entry, AUO_EDPUTINFO, "");
	charselect = (editor->flags & EDITTEXT_WORD) == 0;
	casesensitive = (editor->flags & EDITTEXT_NOCASE) == 0;
	otherc = c = *str;
	if (!casesensitive)
	{
		if (c >= 'a' && c <= 'z')
		{
			otherc += 'A' - 'a';
		} else if (c >= 'A' && c <= 'Z')
		{
			otherc += 'a' - 'A';
		}
	}
	searchlen = strlen(str);
	row = editor->sel1row;
	col = editor->sel1col;
	
	if (editor->flags & EDITTEXT_BACKWARD)
	{
		while (row >= 0)
		{
			lineptr = &editor->table[row];
			if (lineptr->size > 0)
			{
				if (col >= 0)
				{
					offset = col - 1;
				} else
				{
					offset = lineptr->size - searchlen;
				}
				text = lineptr->text + offset;
				while (offset >= 0)
				{
					if ((*text == c || *text == otherc) &&
						((casesensitive && strncmp(str, text, searchlen) == 0) ||
						 strnicmp(str, text, searchlen) == 0) &&
						(charselect ||
						 (offset == 0 && strchr(editor->separator, text[searchlen]) != NULL) ||
						  (strchr(editor->separator, text[-1]) != NULL && strchr(editor->separator, text[searchlen]) != NULL)))
					{
						sel.row1 = row;
						sel.row2 = row;
						sel.col1 = offset;
						sel.col2 = offset + searchlen;
						edit_setselect(editor, &sel);
						return;
					}
					text--;
					offset--;
				}
			}
			col = -1;
			row--;
		}
	} else
	{
		lastrow = editor->t_act;
		col++;
		while (lastrow >= row)
		{
			lineptr = &editor->table[row];
			if (lineptr->size > 0)
			{
				text = lineptr->text + col;
				offset = col;
				while (*text != '\0')
				{
					if ((*text == c || *text == otherc) &&
						((casesensitive && strncmp(str, text, searchlen) == 0) ||
						 strnicmp(str, text, searchlen) == 0) &&
						(charselect ||
						 (offset == 0 && strchr(editor->separator, text[searchlen]) != NULL) ||
						  (strchr(editor->separator, text[-1]) != NULL && strchr(editor->separator, text[searchlen]) != NULL)))
					{
						sel.row1 = row;
						sel.row2 = row;
						sel.col1 = offset;
						sel.col2 = offset + searchlen;
						edit_setselect(editor, &sel);
						return;
					}
					text++;
					offset++;
				}
			}
			col = 0;
			row++;
		}
	}
	
	if (ACSblk->description->flags & AB_ACUSTIC)
		Bconout(2, 7);
	auser->ub_serv(editor->self.entry, AUO_EDPUTINFO, NOTHING_FOUND);
	editor->flags ^= EDITTEXT_BACKWARD;
}

/* -------------------------------------------------------------------------- */

static void edit_getneed(EDITTEXT *editor, long *need)
{
	EDITLINE *lineptr;
	long size;
	long lines;
	
	lineptr = editor->table;
	lines = editor->t_act;
	size = -2;
	while (lines-- >= 0)
	{
		size += lineptr->size + 2;
		lineptr++;
	}
	*need = size;
}

/* -------------------------------------------------------------------------- */

static void edit_selectword(EDITTEXT *editor, long lineno, long col)
{
	EDITLINE *lineptr;
	int16 size;
	char *text;
	int16 col1, col2;
	EDITSEL sel;
	
	lineptr = &editor->table[lineno];
	size = lineptr->size;
	text = lineptr->text;
	col1 = col2 = (int16)col;
	while (col1 > 0 && strchr(editor->separator, text[col1 - 1]) == NULL)
		col1--;
	while (col2 < size && strchr(editor->separator, text[col2]) == NULL)
		col2++;
	
	if (col1 < col2)
	{
		sel.row1 = sel.row2 = lineno;
		sel.col1 = col1;
		sel.col2 = col2;
		edit_setselect(editor, &sel);
	} else
	{
		if (ACSblk->description->flags & AB_ACUSTIC)
			Bconout(2, 7);
	}
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

boolean Auo_editor(OBJECT *entry, int16 task, void* in_out)
{
	AUSERBLK *auser;
	EDITTEXT *editor;
	AUSERBLK *slider;
	EDITLINE *lineptr;
	int16 dummy;
	OBJECT *ver;
	SLLIVE live;
	long pos;
	const char *str;
	Awiob *self;
	
	auser = entry->ob_spec.auserblk;
	editor = auser->ub_ptr1;
	
	switch (task)
	{
	case AUO_EDGETERROR:
		*((int16 *)in_out) = editor->err;
		break;
	
	case AUO_EDRESETERROR:
		editor->err = 0;
		break;
	
	case AUO_EDCURSOR:
		editor->cursor = *((int16 *)in_out);
		break;
	
	case AUO_EDSELECTWORD:
		edit_selectword(editor, editor->sel1row, editor->sel1col);
		break;
	
	case AUO_EDGETNEED:
		edit_getneed(editor, in_out);
		break;
	
	case AUO_EDRESET:
		editor->flags &= ~EDITTEXT_CHANGED;
		break;
	
	case AUO_EDGETCHANGED:
		if (editor->flags & EDITTEXT_CHANGED)
			*((boolean *)in_out) = TRUE;
		else
			*((boolean *)in_out) = FALSE;
		break;
	
	case AUO_EDFIND:
		edit_find(editor, in_out);
		break;
	
	case AUO_EDWORD:
		editor->flags |= EDITTEXT_WORD;
		break;
	
	case AUO_EDNOWORD:
		editor->flags &= ~EDITTEXT_WORD;
		break;
	
	case AUO_EDBACKWARD:
		editor->flags |= EDITTEXT_BACKWARD;
		break;
	
	case AUO_EDFORWARD:
		editor->flags &= ~EDITTEXT_BACKWARD;
		break;
	
	case AUO_EDNOCASE:
		editor->flags |= EDITTEXT_NOCASE;
		break;

	case AUO_EDCASE:
		editor->flags &= ~EDITTEXT_NOCASE;
		break;
	
	case AUO_EDBLOCKMODE:
		if (editor->select == EDIT_SELECT_BLOCK)
			*((boolean *)in_out) = TRUE;
		else
			*((boolean *)in_out) = FALSE;
		break;
	
	case AUO_EDRESIZE:
		resize(entry);
		entry->ob_width = editor->pwidth;
		entry->ob_height = editor->pheight;
		break;
	
	case AUO_EDCLEARUNDO:
		edit_freeundo(editor->text, editor->nrow);
		editor->text = NULL;
		editor->nrow = 0;
		break;
	
	case AUO_EDUNDO:
		edit_undo(editor);
		break;
	
	case AUO_EDGETROW:
		edit_getrow(editor, in_out);
		break;
	
	case AUO_EDGETTABSIZE:
		*((int16 *)in_out) = editor->tabsize;
		break;
	
	case AUO_EDTABSIZE:
		editor->tabsize = *((int16 *)in_out);
		editor->curv1 = vpos(editor->table[editor->sel1row].text, editor->tabsize, (int16)editor->sel1col);
		editor->curv2 = vpos(editor->table[editor->sel2row].text, editor->tabsize, (int16)editor->sel2col);
		break;
	
	case AUO_EDSUB:
		edit_substitute(editor, in_out);
		break;
	
	case AUO_EDGETROWS:
		*((long *)in_out) = editor->t_act + 1;
		break;
	
	case AUO_EDGETLENGTH:
		*((long *)in_out) = editor->table[editor->sel1row].size;
		break;
	
	case AUO_EDGETVCURPOS:
		lineptr = &editor->table[editor->sel1row]; /* FIXME: unused */
		*((long *)in_out) = editor->curv1;
		break;
	
	case AUO_EDGETCURPOS:
		lineptr = &editor->table[editor->sel1row];
		pos = posv(lineptr->text, editor->tabsize, (int16)editor->curv1);
		*((long *)in_out) = pos;
		break;
	
	case AUO_EDUNSELECT:
		edit_unselect(editor);
		break;
	
	case AUO_EDGETSELECT:
		if (editor->select == EDIT_SELECT_DISCONTINUES)
		{
			edit_nextrange(editor, in_out);
		} else if (editor->flags & EDITTEXT_HAS_SELECTION)
		{
			((EDITSEL *)in_out)->row1 = editor->sel1row;
			((EDITSEL *)in_out)->col1 = editor->sel1col;
			((EDITSEL *)in_out)->row2 = editor->sel2row;
			((EDITSEL *)in_out)->col2 = editor->sel2col;
		} else
		{
			((EDITSEL *)in_out)->row1 = -1;
		}
		break;
	
	case AUO_EDSETSELECT:
		edit_setselect(editor, in_out);
		break;
	
	case AUO_EDCALL:
		/* editor->live = *((EDITLIVE *)in_out); */
		editor->live.call = ((EDITLIVE *)in_out)->call;
		editor->live.obj = ((EDITLIVE *)in_out)->obj;
		break;
	
	case AUO_EDLIVE:
		if (editor->live.call)
		{
			lineptr = &editor->table[editor->sel1row];
			if (editor->select != EDIT_SELECT_1 && editor->select != EDIT_SELECT_01)
			{
				str = "";
			} else if ((lineptr->flags & EDITLINE_SELECTED) == 0)
			{
				str = "";
			} else
			{
				str = lineptr->text;
				if (str == NULL)
					str = "";
			}
			editor->live.call(editor->live.obj, str);
		}
		break;
	
	case AUO_ED1SELECT:
		editor->select = EDIT_SELECT_1;
		break;
	
	case AUO_ED01SELECT:
		editor->select = EDIT_SELECT_01;
		break;
	
	case AUO_EDNSELECT:
		editor->select = EDIT_SELECT_CONTINUES;
		break;
	
	case AUO_EDNMSELECT:
		editor->select = EDIT_SELECT_DISCONTINUES;
		break;
	
	case AUO_EDCHARSELECT:
		editor->select = EDIT_SELECT_CHAR;
		break;
	
	case AUO_EDBLKSELECT:
		editor->select = EDIT_SELECT_BLOCK;
		break;
	
	case AUO_SELF:
		self = in_out;
		/* editor->self = *self */
		editor->self.window = self->window;
		editor->self.entry = self->entry;
		editor->self.obnr = self->obnr;
		break;
	
	case AUO_OWNER:
		self = in_out;
		/* *self = editor->self */
		self->window = editor->self.window;
		self->entry = editor->self.entry;
		self->obnr = editor->self.obnr;
		break;
	
	case AUO_EDVIEW:
		edit_view(editor);
		break;
	
	case AUO_EDCURON:
		editor->flags |= EDITTEXT_CURON;
		editor->flags &= ~EDITTEXT_CURVIS;
		break;
	
	case AUO_EDCUROFF:
		editor->flags &= ~(EDITTEXT_CURON | EDITTEXT_CURVIS);
		break;
	
	case AUO_EDCURHIDE:
		if ((editor->flags & EDITTEXT_CURON) && (editor->flags & EDITTEXT_CURVIS))
		{
			change_cur(editor);
			editor->flags &= ~EDITTEXT_CURVIS;
		}
		break;

	case AUO_EDCURSHOW:
		if ((editor->flags & EDITTEXT_CURON) && !(editor->flags & EDITTEXT_CURVIS))
		{
			editor->flags |= EDITTEXT_CURVIS;
			change_cur(editor);
		}
		break;
	
	case AUO_EDCURPOS:
		editor->sel1col = *((long *)in_out);
		editor->sel2col = editor->sel1col;
		editor->curv2 = editor->curv1 = vpos(editor->table[editor->sel1row].text, editor->tabsize, (int16)editor->sel1col);
		break;
	
	case AUO_EDGETPOS:
		*((long *)in_out) = editor->sel1row;
		break;
	
	case AUO_CREATE:
		if (editor_create(entry) != OK)
			*((int16 *)in_out) = FAIL;
		break;
	
	case AUO_TERM:
		edit_free(editor);
		Ax_ifree(editor);
		break;
	
	case AUO_SETVAL:
		lineptr = &editor->table[editor->sel1row];
		Ax_ifree(lineptr->text);
		lineptr->text = NULL;
		lineptr->size = 0;
		edit_add(editor, editor->sel1row, in_out);
		edit_showline(editor, editor->sel1row);
		break;
	
	case AUO_GETVAL:
		lineptr = &editor->table[editor->sel1row];
		if (lineptr->size > 0)
			*((const char **)in_out) = lineptr->text;
		else
			*((const char **)in_out) = "";
		break;
	
	case AUO_EDFONT:
		editor->face = vst_font(ACSblk->vdi_handle, *((int16 *)in_out));
		vst_height(ACSblk->vdi_handle, editor->cheight, &dummy, &editor->cheight, &editor->width, &editor->height);
		resize(entry);
		break;
	
	case AUO_EDHEIGHT:
		editor->cheight = *((int16 *)in_out);
		vst_height(ACSblk->vdi_handle, editor->cheight, &dummy, &editor->cheight, &editor->width, &editor->height);
		resize(entry);
		break;
	
	case AUO_EDCOLOR:
		editor->color = *((int16 *)in_out);
		break;
	
	case AUO_EDCFULL:
		editor->max_col = *((long *)in_out);
		if (editor->max_col > MAX_COLS)
			editor->max_col = MAX_COLS;
		resize(entry);
		break;
	
	case AUO_EDAPPLINE:
		edit_appline(entry, in_out);
		break;
	
	case AUO_EDWRAP:
		editor->wrap = *((long *)in_out);
		if (editor->t_size > editor->wrap)
			editor->wrap = editor->t_size;
		break;
	
	case AUO_EDDELETE:
		edit_free(editor);
		edit_restart(editor);
		break;
		
	case AUO_FULLUPDATE:
		editor->flags |= EDITTEXT_FULLUPDATE;
		/* fall through */
	
	case AUO_UPDATE:
		edit_update(editor);
		editor_cleanup(editor, TRUE);
		break;
	
	case AUO_EDUPDATE:
		edit_update(editor);
		break;
	
	case AUO_NEXT:
		editor->sel1row++;
		if (editor->sel1row > editor->t_act)
			editor->sel1row = editor->t_act;
		/* BUG: curv1 not updated */
		break;
	
	case AUO_PREV:
		editor->sel1row--;
		if (editor->sel1row < 0)
			editor->sel1row = 0;
		break;
	
	case AUO_NEXTPAGE:
		editor->sel1row += editor->row;
		if (editor->sel1row > editor->t_act)
			editor->sel1row = editor->t_act;
		/* BUG: curv1 not updated */
		break;
	
	case AUO_PREVPAGE:
		editor->sel1row -= editor->row;
		if (editor->sel1row < 0)
			editor->sel1row = 0;
		/* BUG: curv1 not updated */
		break;
	
	case AUO_BEGIN:
		editor->sel1row = 0;
		/* BUG: curv1 not updated */
		break;
	
	case AUO_END:
		editor->sel1row = editor->t_act;
		/* BUG: curv1 not updated */
		break;
	
	case AUO_POS:
		editor->sel1row = *((long *)in_out);
		if (editor->sel1row < 0)
			editor->sel1row = 0;
		if (editor->sel1row > editor->t_act)
			editor->sel1row = editor->t_act;
		/* BUG: curv1 not updated */
		break;
	
	case AUO_EDHCOL:
		editor->start_col = *((long *)in_out);
		pos = editor->max_col - editor->col;
		if (editor->start_col > pos)
			editor->start_col = pos;
		if (editor->start_col < 0)
			editor->start_col = 0;
		break;
	
	case AUO_EDGETHCOL:
		*((long *)in_out) = editor->start_col;
		break;
	
	case AUO_EDHROW:
		editor->start_row = *((long *)in_out);
		if (editor->start_row < 0)
			editor->start_row = 0;
		pos = editor->t_act - editor->row + 1;
		if (pos >= 0 && pos < editor->start_row)
			editor->start_row = pos;
		break;
	
	case AUO_EDGETHROW:
		*((long *)in_out) = editor->start_row;
		break;
	
	case AUO_EDNEWLINE:
		edit_newline(entry);
		break;
	
	case AUO_EDVERSLIDER:
		if (editor->flags & EDITTEXT_NEEDS_RESIZE)
			resize(entry);
		self = in_out;
		ver = editor->ver = self->entry;
		live.call = vertical;
		live.obj = &editor->self;
		slider = ver->ob_spec.auserblk;
		slider->ub_serv(ver, AUO_SELF, self);
		slider->ub_serv(ver, AUO_SLCALL, &live);
		slider->ub_serv(ver, AUO_SETVAL, "");
		editor_cleanup(editor, FALSE);
		break;
	
	case AUO_EDHORSLIDER:
		if (editor->flags & EDITTEXT_NEEDS_RESIZE)
			resize(entry);
		self = in_out;
		ver = editor->hor = self->entry;
		live.call = horizontal;
		live.obj = &editor->self;
		slider = ver->ob_spec.auserblk;
		slider->ub_serv(ver, AUO_SELF, self);
		slider->ub_serv(ver, AUO_SLCALL, &live);
		slider->ub_serv(ver, AUO_SLFULL, &editor->max_col);
		slider->ub_serv(ver, AUO_SETVAL, "");
		editor_cleanup(editor, FALSE);
		break;
	
	case AUO_EDSLIDERS:
		editor_cleanup(editor, TRUE);
		break;
	
	case AUO_EDDIRTY:
		editor->flags |= EDITTEXT_CHANGED;
		break;
	
	case AUO_EDSETSEPARATOR:
		strcpy(editor->separator, in_out);
		break;
	
	case AUO_EDGETSEPARATOR:
		*((char **)in_out) = editor->separator;
		break;
	
	case AUO_GETBUBBLE:
	case AUO_GETCONTEXT:
		break;
	
	case AUO_EDPUTINFO:
	default:
		return FALSE;
	}
	return TRUE;
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void edit_forbracket(EDITTEXT *editor, long row, long col, char c)
{
	char otherc;
	EDITSEL sel;
	EDITLINE *lineptr;
	int level;
	AUSERBLK *auser;
	char *text;
	char *str1;
	char *str2;
	
	switch (c)
	{
	case '[':
		otherc = ']';
		break;
	case '(':
		otherc = ')';
		break;
	case '{':
		otherc = '}';
		break;
	case '<':
		otherc = '>';
		break;
#ifdef __GNUC__ /* shut up compiler */
	default:
		return;
#endif
	}
	sel.row1 = row;
	sel.col1 = col;
	col++;
	lineptr = &editor->table[row];
	level = 1;
	while (level > 0)
	{
		if (row > editor->t_act)
		{
			if (ACSblk->description->flags & AB_ACUSTIC)
				Bconout(2, 7);
			auser = editor->self.entry->ob_spec.auserblk;
			auser->ub_serv(editor->self.entry, AUO_EDPUTINFO, NO_PAREN);
			return;
		}
		if (lineptr->size > 0)
		{
			text = lineptr->text + col;
			str1 = strchr(text, c);
			str2 = strchr(text, otherc);
			if (str2 == NULL)
			{
				if (str1 != NULL)
				{
					col = str1 - lineptr->text + 1;
					level++;
				} else
				{
					col = 0;
					row++;
					lineptr++;
				}
			} else
			{
				if (str1 == NULL || str1 > str2)
				{
					col = str2 - lineptr->text + 1;
					level--;
				} else
				{
					col = str1 - lineptr->text + 1;
					level++;
				}
			}
		} else
		{
			col = 0;
			row++;
			lineptr++;
		}
	}
	sel.row2 = row;
	sel.col2 = col;
	edit_setselect(editor, &sel);
}

/* -------------------------------------------------------------------------- */

static void edit_backbracket(EDITTEXT *editor, long row, long col, char c)
{
	char otherc;
	EDITSEL sel;
	EDITLINE *lineptr;
	int level;
	AUSERBLK *auser;
	char *text;
	char *str1;
	char *str2;
	char *ptr;
	char savec;
	
	switch (c)
	{
	case ']':
		otherc = '[';
		break;
	case ')':
		otherc = '(';
		break;
	case '}':
		otherc = '{';
		break;
	case '>':
		otherc = '<';
		break;
#ifdef __GNUC__ /* shut up compiler */
	default:
		return;
#endif
	}
	sel.row2 = row;
	sel.col2 = col + 1;
	lineptr = &editor->table[row];
	level = 1;
	while (level > 0)
	{
		if (col < 0)
		{
			--row;
			--lineptr;
			col = lineptr->size; /* BUG: will access element before table */
		}
		if (row < 0)
		{
			if (ACSblk->description->flags & AB_ACUSTIC)
				Bconout(2, 7);
			auser = editor->self.entry->ob_spec.auserblk;
			auser->ub_serv(editor->self.entry, AUO_EDPUTINFO, NO_PAREN);
			return;
		}
		if (lineptr->size > 0)
		{
			text = lineptr->text;
			ptr = &text[col];
			savec = *ptr;
			*ptr = '\0';
			str1 = strrchr(text, c);
			str2 = strrchr(text, otherc);
			*ptr = savec;
			if (str2 == NULL || str2 >= ptr)
			{
				if (str1 != NULL && str1 < ptr)
				{
					col = str1 - lineptr->text;
					level++;
				} else
				{
					row--;
					lineptr--;
					col = lineptr->size; /* BUG: will access element before table */
				}
			} else
			{
				if (str1 == NULL || str1 >= ptr || str2 > str1)
				{
					col = str2 - lineptr->text;
					level--;
				} else
				{
					col = str1 - lineptr->text;
					level++;
				}
			}
		} else
		{
			row--;
			lineptr--;
			col = lineptr->size; /* BUG: will access element before table */
		}
	}
	sel.row1 = row;
	sel.col1 = col;
	edit_setselect(editor, &sel);
}

/* -------------------------------------------------------------------------- */

static void edit_click(EDITTEXT *editor, int16 mox, int16 moy, int16 kstate)
{
	long row;
	long col;
	long offset;
	EDITLINE *lineptr;
	char *text;
	EDITSEL sel;
	char c;
	
	row = edit_row(editor, moy);
	lineptr = &editor->table[row];
	if (kstate & K_SHIFT)
	{
		sel.row1 = row;
		sel.col1 = 0;
		if (row != editor->t_act)
		{
			sel.row2 = row + 1;
			sel.col2 = 0;
		} else
		{
			sel.row2 = row;
			sel.col2 = lineptr->size;
		}
		edit_setselect(editor, &sel);
	} else
	{
		text = lineptr->text;
		col = edit_col(editor, mox);
		if (lineptr->size <= 0)
		{
			goto error;
		} else
		{
			offset = posv(text, editor->tabsize, (int16)col);
			if (lineptr->size <= offset)
			{
			error:
				if (ACSblk->description->flags & AB_ACUSTIC)
					Bconout(2, 7);
			} else 
			{
				c = text[offset];
				switch (c)
				{
				case '(':
				case '[':
				case '{':
				case '<':
					edit_forbracket(editor, row, offset, c);
					break;
				case ')':
				case ']':
				case '}':
				case '>':
					edit_backbracket(editor, row, offset, c);
					break;
				default:
					if (strchr(editor->separator, c) != NULL)
					{
						goto error;
					} else
					{
						edit_selectword(editor, row, offset);
					}
					break;
				}
			}
		}
	}
}

/* -------------------------------------------------------------------------- */

void Aus_editor(void)
{
	OBJECT *obj = &ACSblk->ev_object[ACSblk->ev_obnr];
	AUSERBLK *auser = obj->ob_spec.auserblk;
	EDITTEXT *editor = auser->ub_ptr1;
	
	switch (editor->select)
	{
	case EDIT_SELECT_01:
		edit_01select(editor, ACSblk->ev_mmoy);
		break;

	case EDIT_SELECT_1:
		edit_1select(editor, ACSblk->ev_mmoy);
		break;

	case EDIT_SELECT_CONTINUES:
		edit_nselect(editor, ACSblk->ev_mmoy, ACSblk->ev_mmokstate, TRUE);
		break;

	case EDIT_SELECT_DISCONTINUES:
		edit_nmselect(editor, ACSblk->ev_mmoy);
		break;
	
	case EDIT_SELECT_CHAR:
		Auo_editor(obj, AUO_EDCURHIDE, NULL);
		if (!(editor->flags & EDITTEXT_HAS_SELECTION))
		{
			editor->flags |= EDITTEXT_HAS_SELECTION;
			editor->sel2row = editor->sel1row;
			editor->sel2col = editor->sel1col;
			editor->curv2 = editor->curv1;
		}
		if (obj->ob_state & AOS_DCLICK)
		{
			edit_click(editor, ACSblk->ev_mmox, ACSblk->ev_mmoy, ACSblk->ev_mmokstate);
		} else
		{
			edit_charselect(editor, ACSblk->ev_mmox, ACSblk->ev_mmoy, ACSblk->ev_mmokstate);
		}
		if (editor->sel1row == editor->sel2row && editor->sel1col == editor->sel2col)
		{
			editor->table[editor->sel1row].flags &= ~EDITLINE_SELECTED;
			editor->flags &= ~EDITTEXT_HAS_SELECTION;
		} else
		{
			editor->flags |= EDITTEXT_HAS_SELECTION;
		}
		Auo_editor(obj, AUO_EDCURSHOW, NULL);
		break;
	
	case EDIT_SELECT_BLOCK:
		Auo_editor(obj, AUO_EDCURHIDE, NULL);
		if (!(editor->flags & EDITTEXT_HAS_SELECTION))
		{
			editor->flags |= EDITTEXT_HAS_SELECTION;
			editor->sel2row = editor->sel1row;
			editor->sel2col = editor->sel1col;
			editor->curv2 = editor->curv1;
		}
		edit_blkselect(editor, ACSblk->ev_mmox, ACSblk->ev_mmoy, ACSblk->ev_mmokstate);
		if (editor->curv1 == editor->curv2)
		{
			edit_selrange(editor, editor->sel1row, editor->sel2row, 0);
			editor->flags &= ~EDITTEXT_HAS_SELECTION;
		} else
		{
			editor->flags |= EDITTEXT_HAS_SELECTION;
		}
		Auo_editor(obj, AUO_EDCURSHOW, NULL);
		break;
	}
}

/* -------------------------------------------------------------------------- */

static void edit_restart(EDITTEXT *editor)
{
	EDITLINE *lineptr;
	
	lineptr = Ax_malloc(sizeof(*lineptr));
	if (lineptr == NULL)
	{
		editor->err |= 1;
	} else
	{
		lineptr->text = NULL;
		lineptr->flags = lineptr->size = 0;
		editor->table = lineptr;
		editor->t_size = 1;
		editor->t_act = editor->start_row = 0;
	}
}

/* -------------------------------------------------------------------------- */

static int16 editor_create(OBJECT *obj)
{
	AUSERBLK *auser;
	EDITTEXT *editor;
	int16 dummy;
	
	auser = obj->ob_spec.auserblk;
	editor = Ax_malloc(sizeof(*editor));
	if (editor == NULL)
		return FAIL;
	auser->ub_ptr1 = editor;
	memcpy(editor, &proto, sizeof(*editor));
	editor->face = vst_font(ACSblk->vdi_handle, editor->face);
	vst_height(ACSblk->vdi_handle, ACSblk->gl_hchar, &dummy, &editor->cheight, &editor->width, &editor->height);
	editor->select = EDIT_SELECT_1;
	editor->tabsize = 4;
	edit_restart(editor);
	return OK;
}

/* -------------------------------------------------------------------------- */

static void editor_cleanup(EDITTEXT *editor, boolean update)
{
	OBJECT *obj;
	AUSERBLK *auser;
	long val;
	
	obj = editor->ver;
	if (obj != NULL)
	{
		auser = obj->ob_spec.auserblk;
		val = editor->t_act + 1;
		if (val < editor->row)
			val = editor->row;
		auser->ub_serv(obj, AUO_SLFULL, &val);
		auser->ub_serv(obj, AUO_SLSIZE, &editor->row);
		auser->ub_serv(obj, AUO_POS, &editor->start_row);
		if (update)
			auser->ub_serv(obj, AUO_UPDATE, NULL);
	}

	obj = editor->hor;
	if (obj != NULL)
	{
		auser = obj->ob_spec.auserblk;
		auser->ub_serv(obj, AUO_SLFULL, &editor->max_col);
		auser->ub_serv(obj, AUO_POS, &editor->start_col);
		auser->ub_serv(obj, AUO_SLSIZE, &editor->col);
		if (update)
			auser->ub_serv(obj, AUO_UPDATE, NULL);
	}
}

/* -------------------------------------------------------------------------- */

static char *horizontal(void *ob, long pos)
{
	OBJECT *obj;
	long val;
	
	val = pos;
	obj = ((Awiob *)ob)->entry;
	Auo_editor(obj, AUO_EDHCOL, &val);
	Auo_editor(obj, AUO_EDUPDATE, NULL);
	return "";
}

/* -------------------------------------------------------------------------- */

static char *vertical(void *ob, long pos)
{
	OBJECT *obj;
	long val;
	
	val = pos;
	obj = ((Awiob *)ob)->entry;
	Auo_editor(obj, AUO_EDHROW, &val);
	Auo_editor(obj, AUO_EDUPDATE, NULL);
	return "";
}

/* -------------------------------------------------------------------------- */

static int16 wwputs(const char *str, OBJECT *entry)
{
	int16 newline_ok, append_ok;
	char *lf;
	char *cr;
	const char *ptr;
	
	append_ok = newline_ok = OK;
	ptr = str;
	for (;;)
	{
		lf = strchr(ptr, '\n');
		cr = strchr(ptr, '\r');
		if (lf == NULL && cr == NULL)
			return edit_appline(entry, ptr);
		if (cr == NULL || (lf != NULL && cr > lf))
		{
			*lf = '\0';
			append_ok = edit_appline(entry, ptr);
			*lf = '\n';
			if (append_ok != FAIL)
				newline_ok = edit_newline(entry);
			ptr = lf + 1;
		} else
		{
			*cr = '\0';
			append_ok = edit_appline(entry, ptr);
			*cr = '\r';
			ptr = cr + 1;
		}
		if (append_ok == FAIL || newline_ok == FAIL)
			return FAIL;
	}
}

/* -------------------------------------------------------------------------- */

int16 uputs(const char *text, OBJECT *entry)
{
	AUSERBLK *auser;
	
	auser = entry->ob_spec.auserblk;
	if (wwputs(text, entry) == FAIL)
		return FAIL;
	auser->ub_serv(entry, AUO_EDUPDATE, NULL);
	edit_newline(entry);
	auser->ub_serv(entry, AUO_UPDATE, NULL);
	return '\n';
}

/* -------------------------------------------------------------------------- */

int16 uvprintf(OBJECT *entry, const char *format, va_list args)
{
	int count;
	AUSERBLK *auser;
	
	auser = entry->ob_spec.auserblk;
	count = vsprintf(buffer, format, args);
	wwputs(buffer, entry);
	auser->ub_serv(entry, AUO_UPDATE, NULL);
	return count;
}

/* -------------------------------------------------------------------------- */

int16 uprintf(OBJECT *entry, const char *format, ... )
{
	va_list args;
	int16 ret;
	
	va_start(args, format);
	ret = uvprintf(entry, format, args);
	va_end(args);
	return ret;
}
