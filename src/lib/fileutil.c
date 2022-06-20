/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      File utilities                                        */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include <ctype.h>

static A_FileList *DateiListe = NULL;
static A_FileList *AktDatei = NULL;

static char scrap[__PS__ * 2];

#ifndef DP_PATHMAX
#  define DP_PATHMAX 2
#endif

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

/* Returns full Path of CFG-File */
char *Af_cfgfile(const char *file)
{
	if (Ast_isEmpty(ACSblk->cfg_path) ||
		Af_length(ACSblk->cfg_path) < -1)
	{
		if (ACSblk->scrp_path[0] == '\0')
		{
			strcpy(scrap, "A:\\");
			scrap[0] += Dgetdrv();
		} else
		{
			strcpy(scrap, ACSblk->scrp_path);
		}
	} else
	{
		strcpy(scrap, ACSblk->cfg_path);
	}
	strcat(scrap, file);
	strcat(scrap, ".cfg");
	return scrap;
}

/* -------------------------------------------------------------------------- */

/* returns filedrv or Dgetdrv if non-exist */
int16 Af_2drv(const char *file)
{
	if (file[1] == ':' && isalpha(file[0]))
	{
		return toupper(file[0]) - 'A';
	} else
	{
		return Dgetdrv();
	}
}

/* -------------------------------------------------------------------------- */

/* Returns Path of file or "\\"  in dest and back */
char *Af_2path(char *dest, const char *file)
{
	const char *slash;
	const char *lastslash;
	
	slash = strchr(file, PATH_SEP);
	if (slash == NULL)
	{
		Dgetpath(dest, 0);
		if (dest[strlen(dest) - 1] != PATH_SEP)
			strcat(dest, "\\");
	} else
	{
		if (!isascii(file[0]) || !isalnum(file[0]) || file[1] != ':')
			slash = file;
		if (Ast_ncmp(file, ".\\", 2) == 0)
			Dgetpath(dest, 0);
		else
			*dest = '\0';
		lastslash = strrchr(file, PATH_SEP);
		strncat(dest, slash, lastslash - slash + 1);
	}
	return dest;
}

/* -------------------------------------------------------------------------- */

/* Returns DEMO from [d:][bla\\bli]\\DEMO[.EXT] or "" in dest and back */
char *Af_2name(char *dest, const char *file)
{
	const char *slash;
	const char *dot;
	
	slash = strrchr(file, PATH_SEP);
	if (slash == NULL)
	{
		slash = strrchr(file, ':');
		if (slash == NULL)
			slash = file;
		else
			slash++;
	} else
	{
		slash++;
	}
	dot = strrchr(slash, '.');
	if (dot == NULL)
	{
		strcpy(dest, slash);
	} else
	{
		strncpy(dest, slash, dot - slash);
		dest[dot - slash] = '\0';
	}
	return dest;
}

/* -------------------------------------------------------------------------- */

/* Returns DEMO[.EXT] from [d:][bla\\bli]\\DEMO[.EXT] or "" in dest and back */
char *Af_2fullname(char *dest, const char *file)
{
	const char *slash;
	
	slash = strrchr(file, PATH_SEP);
	if (slash == NULL)
	{
		slash = strrchr(file, ':');
		if (slash == NULL)
			slash = file;
		else
			slash++;
	} else
	{
		slash++;
	}
	strcpy(dest, slash);
	return dest;
}

/* -------------------------------------------------------------------------- */

/* Returns Extension from the Filename(!) or "" in dest and back */
char *Af_2ext(char *dest, const char *file)
{
	const char *dot;
	const char *slash;
	
	slash = strrchr(file, PATH_SEP);
	dot = strrchr(file, '.');
	if (dot == NULL || slash > dot)
		strcpy(dest, "");
	else
		strcpy(dest, dot + 1);
	return dest;
}

/* -------------------------------------------------------------------------- */

/* Builds full Pathfilename, missing Parts were added to dest and back */
char *Af_buildname(char *dest, int16 drv, const char *path, const char *name, const char *ext)
{
	ssize_t len;
	
	len = 3;
	strcpy(dest, "A:\\");
	if (drv >= 0)
		dest[0] += drv;
	else
		dest[0] += Dgetdrv();
	if (path == NULL || *path == '\0')
	{
		Dgetpath(dest + 2, dest[0] - 'A' + 1);
		len = strlen(strcat(dest, "\\"));
	} else
	{
		strcpy(dest + len, path[0] == PATH_SEP ? path + 1 : path);
		len = strlen(dest);
		if (dest[len - 1] != PATH_SEP)
		{
			strcpy(dest + len, "\\");
			len++;
		}
	}
	if (name != NULL)
	{
		strcat(dest, name);
		if (ext != NULL)
		{
			len = strlen(dest);
			if (dest[len - 1] != '.'
#if WITH_FIXES
				&& ext[0] != '\0' && ext[0] != '.'
#endif
				)
			{
				strcpy(dest + len, ".");
				len++;
			}
			strcpy(dest + len, ext);
		}
	}
	return dest;
}

/* -------------------------------------------------------------------------- */

/* Changes the extension of a filename */
char *Af_chgExt(char *file, const char *new_ext)
{
	char *dotpos;
	char *slash;
	char dot[] = ".";
	
	slash = strrchr(file, PATH_SEP);
	dotpos = strrchr(file, '.');
	if (dotpos == NULL || slash > dotpos)
	{
		strcat(file, dot);
		strcat(file, new_ext);
	} else
	{
		strcpy(dotpos + 1, new_ext);
	}
	return file;
}

/* -------------------------------------------------------------------------- */

/* determine file size */
int32 Af_length(const char *file)
{
	long ret;
	char *slash;
	long fd;
	long size;
	
	size = -2;
	if (file == NULL || *file == '\0')
		return -2;
	if (file[1] == '\0' && file[0] == PATH_SEP)
		return -1;
	if (isascii(file[0]) && isalpha(file[0]) && Ast_cmp(file + 1, ":\\") == 0)
	{
		if (Dsetdrv(Dgetdrv()) & (1L << (file[0] - 'A')))
			return -1;
		return -2;
	}
	Amo_busy();
	slash = strrchr(file, PATH_SEP);
	if (slash != NULL && slash[1] == '\0')
		*slash = '\0';
	else
		slash = NULL;
	ret = Fattrib(file, 0, 0);
	if (ret >= 0)
	{
		if ((int)ret & FA_SUBDIR)
		{
			size = -1;
		} else
		{
			fd = Fopen(file, FO_READ);
			if (fd > 0)
			{
				size = Fseek(0, (int)fd, SEEK_END);
				Fclose((int) fd);
			}
		}
	}
	Amo_unbusy();
	if (slash != NULL)
		*slash = PATH_SEP;
	return size;
}

/* -------------------------------------------------------------------------- */

static A_FileList *Af_readdirOld(char *path)
{
	DTA *olddta;
	DTA dta;
	int16 ret;
	ssize_t len;
	A_FileList *list;
	A_FileList *entry;
	
	len = strlen(path);
	if (path[len - 1] == PATH_SEP)
		strcat(path, "*.*");
	else
		strcat(path, "\\*.*");
	olddta = Fgetdta();
	Fsetdta(&dta);
	list = entry = NULL;
	ret = Fsfirst(path, FA_SUBDIR | FA_RDONLY);
	while (ret == 0)
	{
		if (Ast_cmp(dta.d_fname, ".") != 0 && Ast_cmp(dta.d_fname, "..") != 0)
		{
			if (list == NULL)
			{
				entry = Ax_malloc(sizeof(*entry));
				if (entry == NULL)
					break;
				memset(entry, 0, sizeof(*entry));
				list = entry;
			} else
			{
				entry->next = Ax_malloc(sizeof(*entry));
				if (entry->next == NULL)
					break;
				entry = entry->next;
				memset(entry, 0, sizeof(*entry));
			}
			entry->file = Ax_malloc(len + 20);
			if (entry->file == NULL)
				break;
			entry->file[0] = '\0'; /* FIXME: useless */
			strcpy(entry->file, path);
			entry->file[strlen(entry->file) - 3] = '\0';
			strcat(entry->file, dta.d_fname);
			if (dta.d_attrib & FA_SUBDIR)
				strcat(entry->file, "\\");
			entry->attribs.attr = dta.d_attrib;
			entry->attribs.mtime = dta.d_time;
			entry->attribs.atime = dta.d_time;
			entry->attribs.ctime = dta.d_time;
			entry->attribs.mdate = dta.d_date;
			entry->attribs.adate = dta.d_date;
			entry->attribs.cdate = dta.d_date;
			entry->attribs.dev = Af_2drv(path);
			entry->attribs.size = dta.d_length;
		}
		ret = Fsnext();
	}
	Fsetdta(olddta);
	if (ret == 0)
	{
		Af_freedir(list);
		list = entry = NULL;
	}

	return list;
}

/* -------------------------------------------------------------------------- */

static A_FileList *Af_readdirNew(char *path)
{
	long ret;
	ssize_t len;
	int32 dir;
	int32 xr;
	int16 maxlen;
	boolean goterror;
	A_FileList *list;
	A_FileList *entry;
	char *pathbuf;
	XATTR xattr;
	
	goterror = FALSE;
	len = strlen(path);
	ret = Dpathconf(path, -1);
	if (ret != EINVFN && ret >= DP_PATHMAX)
	{
		ret = Dpathconf(path, DP_PATHMAX);
		maxlen = ret != EINVFN ? (int16)ret + 30 : __PS__ + 22;
	} else
	{
		maxlen = __PS__ + 22;
	}
	pathbuf = Ax_malloc(maxlen);
	if (pathbuf == NULL)
		return NULL;
	*pathbuf = '\0';
	dir = Dopendir(path, FALSE);
	if ((dir & 0xff000000L) == 0xff000000L ||
		dir == EPTHNF ||
		dir == EACCDN ||
		dir == ENSMEM)
	{
		if (dir >= 0)
			Dclosedir(dir);
#if WITH_FIXES
		Ax_free(pathbuf);
#endif
		return NULL;
	}
	list = entry = NULL;
	for (;;)
	{
		ret = Dxreaddir(maxlen, dir, pathbuf, &xattr, &xr);
		if (ret == EINVFN)
		{
			ret = Dreaddir(maxlen, dir, pathbuf);
			while (ret == ERANGE)
				ret = Dreaddir(maxlen, dir, pathbuf);
			if (ret < 0)
			{
				goterror = ret != ENMFIL;
				break;
			}
			xr = EINVFN;
		} else
		{
			while (ret == ERANGE)
				ret = Dxreaddir(maxlen, dir, pathbuf, &xattr, &xr);
			if (ret < 0)
			{
				goterror = ret != ENMFIL;
				break;
			}
		}
#if WITH_FIXES
		if (Ast_cmp(pathbuf + 4, ".") != 0 && Ast_cmp(pathbuf + 4, "..") != 0)
#else
		if (Ast_cmp(pathbuf + 4, ".") != 0 || Ast_cmp(pathbuf + 4, "..") != 0)
#endif
		{
			if (list == NULL)
			{
				entry = Ax_malloc(sizeof(*entry));
				goterror = entry == NULL;
				if (goterror)
					break;
				memset(entry, 0, sizeof(*entry));
				list = entry;
			} else
			{
				entry->next = Ax_malloc(sizeof(*entry));
				goterror = entry->next == NULL;
				if (goterror)
					break;
				entry = entry->next;
				memset(entry, 0, sizeof(*entry));
			}
			entry->file = Ax_malloc(maxlen + len + 1);
			if (entry->file == NULL)
			{
#if WITH_FIXES
				goterror = TRUE;
#endif
				break;
			}
			entry->file[0] = '\0'; /* FIXME: useless */
			strcpy(entry->file, path);
			strcat(entry->file, "\\");
			strcat(entry->file, pathbuf + 4);
			if (xr == EINVFN)
			{
				xr = Fxattr(0, entry->file, &entry->attribs);
				if (xr == EINVFN)
					memset(&entry->attribs, 0, sizeof(entry->attribs));
			} else
			{
				memcpy(&entry->attribs, &xattr, sizeof(xattr));
			}
			if (xr != EINVFN && (entry->attribs.attr & FA_SUBDIR))
				strcat(entry->file, "\\");
		}
	}
	Ax_free(pathbuf);
	Dclosedir(dir);
	if (goterror)
	{
		Af_freedir(list);
		list = entry = NULL;
	}
	return list;
}

/* -------------------------------------------------------------------------- */

A_FileList *Af_readdir(const char *path)
{
	A_FileList *list;
	int16 drv;
	int32 dir;
	ssize_t len;
	char *pathbuf;
	char *slash;
	
	len = strlen(path);
	pathbuf = Ax_malloc(len + 20);
	if (pathbuf == NULL)
		return NULL;
	strcpy(pathbuf, path);
	slash = strrchr(pathbuf, PATH_SEP);
	if (slash != NULL && slash[1] == '\0')
		*slash = '\0';
	if (strlen(pathbuf) == 2 && pathbuf[1] == ':')
		strcat(pathbuf, "\\");
	drv = Dgetdrv();
	Dsetdrv(Af_2drv(path));
	dir = Dopendir(".", FALSE);
	Dsetdrv(drv);
	if (dir == EINVFN)
	{
		list = Af_readdirOld(pathbuf);
	} else
	{
		if (dir > 0)
			Dclosedir(dir);
		list = Af_readdirNew(pathbuf);
	}
	Ax_free(pathbuf);
	return list;
}

/* -------------------------------------------------------------------------- */

void Af_freedir(A_FileList *list)
{
	A_FileList *entry;
	
	while (list != NULL)
	{
		entry = list;
		list = list->next;
		if (entry->file != NULL)
			Ast_delete(entry->file);
		Ax_free(entry);
	}
}

/* -------------------------------------------------------------------------- */

char *Af_first(const char *start, XATTR *fileinfo)
{
	if (DateiListe != NULL)
	{
		Af_freedir(DateiListe);
		DateiListe = AktDatei = NULL;
	}
	DateiListe = Af_readdir(start);
	if (DateiListe == NULL)
		return NULL;
	return Af_next(fileinfo);
}

/* -------------------------------------------------------------------------- */

char *Af_next(XATTR *fileinfo)
{
	if (DateiListe == NULL)
		return NULL;
	if (AktDatei == NULL)
		AktDatei = DateiListe;
	else
		AktDatei = AktDatei->next;
	if (AktDatei == NULL)
	{
		Af_freedir(DateiListe);
		DateiListe = AktDatei = NULL;
	} else
	{
		if (fileinfo != NULL)
			memcpy(fileinfo, &AktDatei->attribs, sizeof(*fileinfo));
		return AktDatei->file;
	}
	return NULL;
}

/* -------------------------------------------------------------------------- */

int32 Af_pathconf(int16 drv, int16 mode)
{
	static int16 max_mode = -2;
	long ret;
	char path[] = "A:\\";
	
	path[0] += drv > 0 ? drv - 1 : Dgetdrv();
	if (max_mode < -1)
	{
		ret = Dpathconf(path, -1);
		if (ret != EINVFN)
			max_mode = (int)(ret & -1);
		else
			max_mode = -1;
	}
	if (mode <= max_mode)
		return Dpathconf(path, mode);
	else
		return EINVFN;
}

/* -------------------------------------------------------------------------- */

#define QUOTES "'\""

char *Af_quote(char *dest, const char *source)
{
	char *ptr;
	char *dst;
	int16 singlequotes;
	
	if (dest != source)
		strcpy(dest, source);
	Ast_alltrim(dest);
	if (strpbrk(dest, " \t\n\r'") != NULL)
	{
		singlequotes = 0;
		for (ptr = dest; *ptr != '\0'; ptr++)
		{
			if (*ptr == QUOTES[0])
				singlequotes++;
		}
		ptr = dest + strlen(dest);
		dst = ptr + singlequotes + 1;
		while (ptr >= dest)
		{
			if (*ptr == QUOTES[0])
			{
				*dst = *ptr;
				dst--;
			}
			*dst = *ptr;
			ptr--;
			dst--;
		}
		*dest = QUOTES[0];
		dst = dest + strlen(dest);
		*dst++ = QUOTES[0];
		*dst = '\0';
	}
	return dest;
}

/* -------------------------------------------------------------------------- */

char *Af_unquote(char *dest, const char *source)
{
	char *ptr;
	char *dst;
	char c;
	
	if (dest != source)
		strcpy(dest, source);
	Ast_alltrim(dest);
	c = dest[0];
	if (strchr(QUOTES, c) != NULL && c == dest[strlen(dest) - 1])
	{
		for (dst = dest, ptr = dest + 1; *ptr != '\0'; ptr++, dst++)
		{
			if (*ptr == c)
			{
				if (ptr[0] == ptr[1])
					++ptr;
				else
					break;
			}
			*dst = *ptr;
		}
		*dst = '\0';
	}
	return dest;
}

/* -------------------------------------------------------------------------- */

ULinList *Af_parseCmdLine(const char *file_string)
{
	char *ptr;
	char *dst;
	char *file;
	char c;
	char buf[__PS__];
	char *str;
	ULinList *list;
	
	list = Alu_create();
	if (list == NULL)
		return NULL;
	str = Ast_create(file_string);
	if (str == NULL)
		return NULL;
	for (ptr = str; !Ast_isEmpty(ptr); )
	{
#if WITH_FIXES
		while (*ptr == ' ' || *ptr == '\t' || *ptr == '\n' || *ptr == '\r')
			ptr++;
		if (*ptr == '\0')
			break;
#else
		Ast_alltrim(ptr);
#endif
		c = ptr[0];
		if (strchr(QUOTES, c) != NULL)
		{
			++ptr;
			dst = buf;
			while (*ptr != '\0')
			{
				if (*ptr == c)
				{
					++ptr;
					if (ptr[-1] != ptr[0])
						break;
				}
				*dst = *ptr;
				ptr++;
				dst++;
			}
			*dst = '\0';
		} else
		{
			dst = strpbrk(ptr, " \t\n\r'");
			if (dst != NULL)
			{
				char endc;
				
				endc = *dst;
				*dst = '\0';
				strcpy(buf, ptr);
				ptr = dst;
#if WITH_FIXES
				*ptr++ = endc;
#else
				*ptr = endc;
#endif
			} else
			{
				strcpy(buf, ptr);
				ptr = NULL;
			}
		}
		file = Ast_create(buf);
		if (file != NULL)
			list->append(list, file);
	}
	Ast_delete(str);
	return list;
}
