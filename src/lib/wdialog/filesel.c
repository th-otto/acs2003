#include "acs_i.h"
#include "filesel.ah"
#include "messages/msgserv.h"

typedef struct {
	unsigned long id;			/* Selectric ID (SLCT) */
	uint16 version;				/* version (BCD-Format) */
	struct {
		unsigned int pthsav:1;
		unsigned int stdest:1;
		unsigned int autloc:1;
		unsigned int numsrt:1;
		unsigned int lower:1;
		unsigned int dclick:1;
		unsigned int hidden:1;
		unsigned int bypass:1;
	} config;
	int16 sort;
	int16 num_ext;
	char **ext;
	int16 num_paths;
	char **paths;
	int16 comm;
	int16 in_count;
	void *in_ptr;
	int16 out_count;
	void *out_ptr;
} SLCT_STR;

static SLCT_STR *multi_cook = NULL; /* file-selector present */
static char **multi_files = NULL;
static int multi_count = 0;
static int multi_idx = 0;
static long bkhndler = 0;      /* BoxKite present */

static char multi_opath[__PS__];
static char *multi_pathend;

static boolean hasFslx(void);
static boolean fslxCreate(A_FileSelData *data);
static ULinList *fslxMakeListe(A_FileSelData *data);


static void CDECL fsmesshndler(int16 *msg)
{
	Aev_message(msg);
}


char *Af_select(const char *title, char *path, const char *ext)
{
	char *fname;
	char *result;
	int16 button;
	int16 ret;
	char filename[58]; /* BUG: should be __PS__ */
	int16 busy;
	Amouse mouse;
	
	Aev_unhidepointer();
	busy = Amo_restart(&mouse);
	if (multi_cook == NULL && Ash_getcookie(C_FSEL, &multi_cook) == FALSE)
		multi_cook = NULL;
	if (bkhndler == 0 && Ash_getcookie(C_HBFS, &bkhndler) == FALSE)
		bkhndler = 0;
	fname = strrchr(path, PATH_SEP);
	if (*path == '\0' || fname == NULL)
	{
		Af_buildname(path, -1, NULL, NULL, NULL);
		fname = strrchr(path, PATH_SEP);
	}
	Af_2fullname(filename, fname);
	if (filename[0] == '*')
		filename[0] = '\0';
	/*
	 * allow either "*.ext" or just "ext"
	 */
#if WITH_FIXES
	fname[1] = '\0';
	if (Ast_incmp(ext, "*.", 2) != 0)
	{
		strcpy(fname + 1, "*.");
		strcpy(fname + 3, ext);
	} else
	{
		strcpy(fname + 1, ext);
		/* do not append the wildcard to the selected filename */
		ext += 2;
	}
#else
	if (Ast_incmp(ext, "*.", 2) != 0)
		strcpy(fname + 1, "*.");
	else
		fname[1] = '\0';
	strcat(fname, ext);
#endif
	if (bkhndler != 0)
	{
		ret = fsel_boxinput(path, filename, &button, title, fsmesshndler);
	} else
	{
		Awi_update(BEG_UPDATE);
		if (multi_cook == NULL || multi_cook->version < 0x200)
			Awi_update(BEG_MCTRL);
		if (ACSblk->AESglobal[0] >= 0x140 || multi_cook != NULL)
			ret = fsel_exinput(path, filename, &button, title);
		else
			ret = fsel_input(path, filename, &button);
		if (multi_cook == NULL || multi_cook->version < 0x200)
			Awi_update(END_MCTRL);
		Awi_update(END_UPDATE);
	}
	if (ret != 0 && button != 0 && path[1] == ':')
	{
		if (filename[0] != '\0')
		{
			/* BUG: ext may contain wildcards */
			if (strlen(filename) == 9 && filename[8] == '.')
				strcat(filename, ext);
			if (strchr(filename, '.') == NULL)
			{
				strcat(filename, ".");
				strcat(filename, ext);
			}
		}
		fname = strrchr(path, PATH_SEP);
		strcpy(fname + 1, filename);
		result = path;
	} else
	{
		result = NULL;
	}
	Amo_return(busy, &mouse);
	Aev_mess();
	return result;
}


static void free_multidata(void)
{
	int i;
	
	for (i = 0; i < multi_count; i++)
		if (multi_files[i] != NULL)
			Ax_glfree(multi_files[i]);
	Ax_glfree(multi_files);
	multi_files = NULL;
	multi_pathend = NULL;
	multi_idx = multi_count = 0;
	multi_opath[0] = '\0';
}


char *Af_first_fsel(const char *title, char *path, const char *ext)
{
	char *filename;
	int16 count, i;
	
	multi_idx = 0;
	
	if (multi_cook == NULL)
		Ash_getcookie(C_FSEL, &multi_cook);
	if (multi_cook != NULL)
	{
		if (multi_files != NULL)
			free_multidata();
		count = ACSblk->mfsel_count < 1 ? 1 : ACSblk->mfsel_count;
		multi_files = (char **)Ax_glmalloc(count * sizeof(*multi_files));
		if (multi_files != NULL)
		{
			memset(multi_files, 0, count * sizeof(*multi_files));
			multi_count = count;
			for (i = 0; i < count; i++)
			{
				multi_files[i] = Ax_glmalloc(36); /* BUG: why only 36? */
				if (multi_files[i] == NULL)
				{
					free_multidata();
					break;
				}
				multi_files[i][0] = '\0';
			}
		}
	}
	
	if (multi_cook != NULL)
	{
		if (multi_files != NULL)
		{
			multi_cook->comm = 1;
			multi_cook->out_count = count;
			multi_cook->out_ptr = multi_files;
		} else
		{
			multi_cook->comm = multi_cook->out_count = 0;
			multi_cook->out_ptr = NULL;
		}
	}
	filename = Af_select(title, path, ext);
	if (filename != NULL)
	{
		strcpy(multi_opath, filename);
		if (multi_cook != NULL && multi_files != NULL && multi_files[0][0] != '\0')
		{
			multi_pathend = &multi_opath[strlen(multi_opath)];
			filename = strrchr(multi_opath, PATH_SEP);
			if (filename != NULL)
			{
				if (filename[1] == '\0')
				{
					if (filename[0] != ':')
					{
						filename[0] = '\0';
						filename = strrchr(multi_opath, PATH_SEP);
						if (filename != NULL)
							multi_pathend = filename + 1;
					}
				} else
				{
					multi_pathend = filename + 1;
				}
			}
			strcpy(multi_pathend, multi_files[multi_idx]);
			filename = multi_opath;
			multi_idx++;
		}
	}
	return filename;
}


char *Af_next_fsel(void)
{
	char *filename;
	
	filename = NULL;
	if (multi_files != NULL && multi_idx < multi_count && multi_opath[0] != '\0')
	{
		if (multi_idx >= multi_cook->out_count || multi_files[multi_idx][0] == '\0')
		{
			free_multidata();
		} else
		{
			strcpy(multi_pathend, multi_files[multi_idx]);
			filename = multi_opath;
			multi_idx++;
		}
	}
	return filename;
}


void Ash_fileSetIcon(CICONBLK *icon, int16 ghost)
{
	WI_FILESEL.iconblk = icon;
	if (WI_FILESEL.iconblk == NULL)
	{
		WI_FILESEL.kind &= ~(AW_ICON | AW_GHOSTICON);
	} else
	{
		WI_FILESEL.kind |= AW_ICON;
		if (ghost)
			WI_FILESEL.kind |= AW_GHOSTICON;
		else
			WI_FILESEL.kind &= ~AW_GHOSTICON;
	}
}


ULinList *Ash_fileselect(const char *title, int16 x, int16 y, char *path, char *fname,
	char *patterns, XFSL_FILTER *filter, char *paths, int16 sort_mode,
	int16 flags, Awindow *meldung)
{
	A_FileSelData *data;
	Awindow *window;
	ULinList *list;
	
	window = NULL;
	list = NULL;
	if (!hasFslx())
		return NULL;
	data = (A_FileSelData *)Ax_malloc(sizeof(*data));
	if (data == NULL)
		return NULL;
	memset(data, 0, sizeof(*data));
	data->title = title;
	data->x = x;
	data->y = y;
	data->path = path;
	data->pathlen = __PS__;
	data->fname = fname;
	data->fnamelen = __PS__;
	data->patterns = patterns;
	data->filter = filter;
	data->paths = paths;
	data->sort_mode = sort_mode;
	data->flags = flags;
	data->meldung = meldung;
	window = WI_FILESEL.create(data);
	if (window == NULL)
	{
		if (meldung == NULL && fslxCreate(data))
		{
			data->dialog = fslx_do(data->title, data->path, data->pathlen,
				data->fname, data->fnamelen,
				data->patterns, data->filter,
				data->paths, &data->sort_mode,
				data->flags, &data->button,
				&data->nfiles, &data->patterns);
			list = data->liste = fslxMakeListe(data);
			fslx_close(data->dialog);
		}
		Ax_free(data->patterns);
		Ax_free(data->fname);
		Ax_free(data->path);
		Ax_recycle(data, sizeof(*data));
	} else
	{
		data->modal = meldung == NULL;
		if (data->modal)
		{
			Awi_dialog(window);
			list = data->liste;
			window->service(window, AS_TERM, NULL);
			Ax_free(data->patterns);
			Ax_free(data->fname);
			Ax_free(data->path);
			Ax_recycle(data, sizeof(*data));
		} else
		{
			if (window->open(window) == OK)
				list = Alu_create();
			else
				window->service(window, AS_TERM, NULL);
		}
	}

	return list;
}


static char *ConvertExt4Use(char *dst, char *src, char sep, boolean shortnames, boolean duplicates, boolean skip)
{
	char *lastsep;
	char *srcptr;
	char *dstptr;
	char *comma;
	boolean haswild;
	char buf[__PS__ * 2];
	
	haswild = FALSE;
	if (Ast_isEmpty(src))
	{
		if (!shortnames)
		{
			dst[0] = '*';
			dst[1] = '\0';
			dst[2] = '\0';
		} else
		{
			dst[0] = '*';
			dst[1] = '.';
			dst[2] = '*';
			dst[3] = '\0';
			dst[4] = '\0';
		}
		return dst;
	}
	dst[0] = '\0';
	
	for (srcptr = src, lastsep = dstptr = dst; srcptr[0] != '\0' || srcptr[1] != '\0'; srcptr++)
	{
		comma = strchr(srcptr, ',');
		if (comma != NULL)
			*comma = '\0';
		if (!shortnames || strchr(srcptr, '.') == NULL)
		{
			sprintf(buf, "*.%s", srcptr);
		} else
		{
			strcpy(buf, srcptr);
		}
		if (duplicates || Ast_istr(lastsep, buf) == NULL)
		{
			strcpy(dstptr, buf);
			if (Ast_cmp(srcptr, "*") == 0)
				haswild = TRUE;
		}
		while (*dstptr != '\0')
			dstptr++;
		if (dstptr[-1] == ',')
			dstptr--;
		if (comma != NULL)
		{
			*dstptr++ = ',';
			*dstptr = '\0';
		} else
		{
			*dstptr++ = sep;
			if (sep == 0)
				lastsep = dstptr;
		}
		if (comma != NULL)
		{
			*comma = ',';
			srcptr = comma;
		} else
		{
			while (*srcptr != '\0')
				srcptr++;
		}
		if (skip)
		{
			while (srcptr[0] != '\0' || srcptr[1] != '\0')
				srcptr++;
			srcptr--;
		}
	}
	if (dstptr[-1] == ',')
		*--dstptr = '\0';
	if (!haswild && (!shortnames || Ast_isEmpty(dst)))
	{
		*dstptr++ = '*';
		if (shortnames)
		{
			*dstptr++ = '.';
			*dstptr++ = '*';
		}
		*dstptr++ = '\0';
	}
	*dstptr++ = '\0';
	*dstptr++ = '\0';
	return dst;
}


static char *ConvertExt2MagiC(char *dst, char *src)
{
	return ConvertExt4Use(dst, src, '\0', FALSE, TRUE, FALSE);
}


static char *ConvertExt2TOS(char *dst, char *src)
{
	boolean skip = TRUE;
	boolean duplicates = FALSE;
	return ConvertExt4Use(dst, src, ',', TRUE, duplicates, skip);
}


static ULinList *SingleSelect(const char *title, char *path, char *patterns)
{
	ULinList *list;
	char buf[__PS__];
	
	list = Alu_create();
	if (list != NULL)
	{
		ConvertExt2TOS(buf, patterns);
		if (Af_select(title, path, buf) != NULL && !Ast_isEmpty(path))
		{
			list->append(list, Ast_create(path));
		}
	}
	return list;
}


static ULinList *MultiSelect(const char *title, char *path, char *patterns)
{
	ULinList *list;
	char *filename;
	char buf[__PS__];
	
	list = Alu_create();
	if (list != NULL)
	{
		ConvertExt2TOS(buf, patterns);
		filename = Af_first_fsel(title, path, buf);
		while (filename != NULL)
		{
			if (!Ast_isEmpty(filename))
				list->append(list, Ast_create(filename));
			filename = Af_next_fsel();
		}
	}
	return list;
}


static ULinList *MagiCSelect(const char *title, char *path, int16 sort_mode, boolean multi, char *ext, Awindow *meldung)
{
	ULinList *list;
	char buf[__PS__];
	char filename[__PS__];
	char patternbuf[__PS__];
	char *patterns;
	
	list = NULL;
	strcpy(buf, "A:");
	buf[0] += Af_2drv(path);
	Af_2path(&buf[2], path);
	Af_2fullname(filename, path);
	if (Ast_icmp(filename, "*") == 0)
		filename[0] = '\0';
	patterns = ConvertExt2MagiC(patternbuf, ext);
	list = Ash_fileselect(title, -1, -1, buf, filename, patterns, 0, NULL, sort_mode >= SORTDEFAULT && sort_mode < SORTBYNONE ? sort_mode : SORTBYNAME, multi ? GETMULTI : 0, meldung);
	return list;
}


ULinList *Af_fileselect(const char *title, char *path, char *ext, int16 sort_mode, boolean multi, Awindow *window)
{
	ULinList *list;
	
	list = NULL;
	if (hasFslx())
	{
		list = MagiCSelect(title, path, sort_mode, multi, ext, window);
	}
	if (list == NULL)
	{
		if (multi)
			list = MultiSelect(title, path, ext);
		else
			list = SingleSelect(title, path, ext);
	}
	return list;
}


static boolean hasFslx(void)
{
	static int16 vorhanden = -1;
	int16 w1, w2, w3, w4;
	
	if (vorhanden < 0)
	{
		/* FIXME: relies on appl_getinfo doing check for availability */
		if (appl_getinfo(AES_WDIALOG, &w1, &w2, &w3, &w4))
			vorhanden = (w1 & 8) != 0;
		else
			vorhanden = 0;
	}
	return vorhanden != 0;
}


static ULinList *fslxMakeListe(A_FileSelData *data)
{
	ULinList *list;
	boolean done;
	size_t len;
	char *filename;
	
	if (data->liste != NULL)
		return data->liste;
	data->liste = list = Alu_create();
	if (list != NULL && data->button != 0)
	{
		done = FALSE;
		while (!done)
		{
			if (!Ast_isEmpty(data->fname))
			{
				len = strlen(data->path) + strlen(data->fname);
				filename = Ax_malloc(len + 2);
				if (filename == NULL)
				{
					Alu_delete(list);
					break; /* BUG: list not nullified */
				}
				strcpy(filename, data->path);
				strcat(filename, data->fname);
				if (!Ast_isEmpty(filename))
					list->append(list, filename);
			}
			done = data->nfiles < 1 || fslx_getnxtfile(data->dialog, data->fname) == 0;
		}
	}
	return list;
}


static boolean fslxCreate(A_FileSelData *data)
{
	data->dialog = fslx_open(data->title, data->x, data->y, data->handle,
		data->path, data->pathlen,
		data->fname, data->fnamelen,
		data->patterns, data->filter, data->paths,
		data->sort_mode, data->flags);
	return data->dialog != NULL;
}


static boolean fslxClose(A_FileSelData *data)
{
	fslxMakeListe(data);
	if (data->dialog != NULL)
	{
		fslx_close(data->dialog);
		if (data->window != NULL)
			Awi_closed(data->window);
		data->window = NULL;
		data->dialog = NULL;
	}
	if (data->meldung != NULL)
	{
		data->meldung->service(data->meldung, AS_FILESELECT, data->liste);
		if (data->liste != NULL)
		{
			Alu_delete(data->liste);
			data->liste = NULL;
		}
	}
	return TRUE;
}


static int16 fslxMessage(A_FileSelData *data, EVNT *event)
{
	int16 ret;
	int16 nfiles;
	
	/* BUG: event->msg[1] should be our application ID */
	event->msg[3] = *data->handle;
	Awi_update(RESET_UPDATE);
	ret = fslx_evnt(data->dialog, event, data->path, data->fname, &data->button, &nfiles, &data->sort_mode, &data->patterns);
	Awi_update(RESTART_UPDATE);
	if (ret == 0)
	{
		data->nfiles = nfiles;
		fslxClose(data);
	}
	return ret;
}


static Awindow *FileCreate(void *a)
{
	A_FileSelData *data = a;
	Awindow *window;
	char *title;
	char *str;
	char *ptr;
	size_t len;
	
	window = NULL;
	if (a == NULL)
		return NULL;
	str = data->path;
	data->pathlen = __PS__;
	data->path = Ax_malloc(data->pathlen);
	if (data->path == NULL)
		return NULL;
	strcpy(data->path, str);
	str = data->fname;
	data->fnamelen = __PS__;
	data->fname = Ax_malloc(data->fnamelen);
	if (data->fname == NULL)
	{
		Ax_free(data->path);
		return NULL;
	}
	strcpy(data->fname, str);
	if (!Ast_isEmpty(data->patterns))
	{
		len = 2;
		str = data->patterns;
		while (str[0] != '\0' || str[1] != '\0')
		{
			len++;
			str++;
		}
		str = data->patterns;
	} else
	{
		len = 3;
		str = "*\0\0";
	}
	data->patterns = Ax_malloc(len);
	if (data->patterns == NULL)
	{
		Ax_free(data->fname);
		Ax_free(data->path);
		return NULL;
	}
	ptr = data->patterns;
	while (str[0] != '\0' || str[1] != '\0')
	{
		*ptr = *str;
		str++;
		ptr++;
	}
	ptr[0] = '\0';
	ptr[1] = '\0';
	window = Awi_create(&WI_FILESEL);
	if (window == NULL)
		return NULL; /* BUG: leaks memory allocated above */
	title = Ast_create(data->title);
	if (title != NULL)
	{
		Ast_delete(window->name);
		window->name = title;
	}
	data->dialog = NULL;
	data->handle = &window->wi_id;
	window->user = data;
	data->window = window;
	return window;
}


#ifdef __PUREC__
#pragma warn -par
#endif
static int16 FileService(Awindow *self, int16 task, void *in_out)
{
	A_FileSelData *data = (A_FileSelData *)self->user;

	switch (task)
	{
	case AS_TERM:
		if (!(self->state & AWS_INTERM))
		{
			self->state |= AWS_INTERM;
			Awi_delete(self);
			data->window = NULL;
			fslxClose(data);
			if (!data->modal)
			{
				if (data->liste != NULL)
					Alu_delete(data->liste);
				Ax_free(data->patterns);
				Ax_free(data->fname);
				Ax_free(data->path);
				Ax_recycle(data, sizeof(*data));
			}
		}
		return TRUE;
	}
	return FALSE;
}
#ifdef __PUREC__
#pragma warn .par
#endif


static int16 FileOpen(Awindow *self)
{
	A_FileSelData *data = (A_FileSelData *)self->user;

	if (fslxCreate(data))
	{
		wind_get(self->wi_id, WF_CURRXYWH, &self->wi_act.x, &self->wi_act.y, &self->wi_act.w, &self->wi_act.h);
		wind_get(self->wi_id, WF_WORKXYWH, &self->wi_work.x, &self->wi_work.y, &self->wi_work.w, &self->wi_work.h);
		self->work->ob_x = 0;
		self->work->ob_y = 0;
		self->work->ob_width = self->wi_work.w;
		self->work->ob_height = self->wi_work.h;
		Awi_register(self);
		return OK;
	} else
	{
		return FAIL;
	}
}


static void FileClosed(Awindow *self)
{
	A_FileSelData *data = (A_FileSelData *)self->user;
	EVNT event = { MU_MESAG, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { WM_CLOSED, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(ACSblk->ev_mkreturn);
	event.key = nkc_n2gem(ACSblk->ev_mkreturn);
	event.mclicks = ACSblk->ev_mbreturn;
	fslxMessage(data, &event);
}


static void FileRedraw(Awindow *self, Axywh *area)
{
	A_FileSelData *data = (A_FileSelData *)self->user;
	EVNT event = { MU_MESAG, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { WM_REDRAW, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(ACSblk->ev_mkreturn);
	event.key = nkc_n2gem(ACSblk->ev_mkreturn);
	event.mclicks = ACSblk->ev_mbreturn;
	event.msg[4] = area->x;
	event.msg[5] = area->y;
	event.msg[6] = area->w;
	event.msg[7] = area->h;
	fslxMessage(data, &event);
}


#ifdef __PUREC__
#pragma warn -par
#endif
static void FileArrowed(Awindow *self, int16 which, int16 amount)
{
	A_FileSelData *data = (A_FileSelData *)self->user;
	EVNT event = { MU_MESAG, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { WM_ARROWED, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(ACSblk->ev_mkreturn);
	event.key = nkc_n2gem(ACSblk->ev_mkreturn);
	event.mclicks = ACSblk->ev_mbreturn;
	event.msg[4] = which;
	fslxMessage(data, &event);
}
#ifdef __PUREC__
#pragma warn .par
#endif


#ifdef __PUREC__
#pragma warn -par
#endif
static void FileChange(Awindow *self, int16 obnr, int16 new_state)
{
	self->redraw(self, &self->wi_work);
}
#ifdef __PUREC__
#pragma warn .par
#endif


static void FileFulled(Awindow *self)
{
	A_FileSelData *data = (A_FileSelData *)self->user;
	EVNT event = { MU_MESAG, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { WM_FULLED, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(ACSblk->ev_mkreturn);
	event.key = nkc_n2gem(ACSblk->ev_mkreturn);
	event.mclicks = ACSblk->ev_mbreturn;
	fslxMessage(data, &event);
}


#ifdef __PUREC__
#pragma warn -par
#endif
static int16 FileInit(Awindow *self)
{
	return OK;
}
#ifdef __PUREC__
#pragma warn .par
#endif


static void FileHSlide(Awindow *self, int16 pos)
{
	A_FileSelData *data = (A_FileSelData *)self->user;
	EVNT event = { MU_MESAG, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { WM_HSLID, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(ACSblk->ev_mkreturn);
	event.key = nkc_n2gem(ACSblk->ev_mkreturn);
	event.mclicks = ACSblk->ev_mbreturn;
	event.msg[4] = pos;
	fslxMessage(data, &event);
}


static void FileVSlide(Awindow *self, int16 pos)
{
	A_FileSelData *data = (A_FileSelData *)self->user;
	EVNT event = { MU_MESAG, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { WM_VSLID, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(ACSblk->ev_mkreturn);
	event.key = nkc_n2gem(ACSblk->ev_mkreturn);
	event.mclicks = ACSblk->ev_mbreturn;
	event.msg[4] = pos;
	fslxMessage(data, &event);
}


#ifdef __PUREC__
#pragma warn -par
#endif
static int16 FileKeys(Awindow *self, int16 kstate, int16 key)
{
	A_FileSelData *data = (A_FileSelData *)self->user;
	EVNT event = { MU_KEYBD, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(key);
	event.key = nkc_n2gem(key);
	event.mclicks = ACSblk->ev_mbreturn;
	fslxMessage(data, &event);
	return OK;
}
#ifdef __PUREC__
#pragma warn .par
#endif


static void FileTopped(Awindow *self)
{
	A_FileSelData *data = (A_FileSelData *)self->user;
	EVNT event = { MU_MESAG, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { WM_TOPPED, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(ACSblk->ev_mkreturn);
	event.key = nkc_n2gem(ACSblk->ev_mkreturn);
	event.mclicks = ACSblk->ev_mbreturn;
	fslxMessage(data, &event);
}


static void FileMoved(Awindow *self, Axywh *area)
{
	A_FileSelData *data = (A_FileSelData *)self->user;
	EVNT event = { MU_MESAG, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { WM_MOVED, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(ACSblk->ev_mkreturn);
	event.key = nkc_n2gem(ACSblk->ev_mkreturn);
	event.mclicks = ACSblk->ev_mbreturn;
	event.msg[4] = area->x;
	event.msg[5] = area->y;
	event.msg[6] = area->w;
	event.msg[7] = area->h;
	fslxMessage(data, &event);
	wind_get(self->wi_id, WF_CURRXYWH, &self->wi_act.x, &self->wi_act.y, &self->wi_act.w, &self->wi_act.h);
	wind_get(self->wi_id, WF_WORKXYWH, &self->wi_work.x, &self->wi_work.y, &self->wi_work.w, &self->wi_work.h);
	self->work->ob_width = self->wi_work.w;
	self->work->ob_height = self->wi_work.h;
}


static void FileSized(Awindow *self, Axywh *area)
{
	A_FileSelData *data = (A_FileSelData *)self->user;
	EVNT event = { MU_MESAG, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { WM_SIZED, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(ACSblk->ev_mkreturn);
	event.key = nkc_n2gem(ACSblk->ev_mkreturn);
	event.mclicks = ACSblk->ev_mbreturn;
	event.msg[4] = area->x;
	event.msg[5] = area->y;
	event.msg[6] = area->w;
	event.msg[7] = area->h;
	fslxMessage(data, &event);
	wind_get(self->wi_id, WF_CURRXYWH, &self->wi_act.x, &self->wi_act.y, &self->wi_act.w, &self->wi_act.h);
	wind_get(self->wi_id, WF_WORKXYWH, &self->wi_work.x, &self->wi_work.y, &self->wi_work.w, &self->wi_work.h);
	self->work->ob_width = self->wi_work.w;
	self->work->ob_height = self->wi_work.h;
}


static int16 FileIconify(Awindow *self, boolean all)
{
	return Awi_iconify(self, all);
}


static int16 FileUniconify(Awindow *self)
{
	return Awi_uniconify(self);
}


static int16 FileGEMScript(Awindow *self, int16 anz, char **cmds, A_GSAntwort *answer)
{
	return Awi_gemscript(self, anz, cmds, answer);
}


static void FileClicked(void)
{
	A_FileSelData *data = (A_FileSelData *)ACSblk->ev_window->user;
	EVNT event = { MU_BUTTON, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(ACSblk->ev_mkreturn);
	event.key = nkc_n2gem(ACSblk->ev_mkreturn);
	event.mclicks = ACSblk->ev_mbreturn;
	fslxMessage(data, &event);
}
