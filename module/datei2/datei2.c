/* #define DEBUG 1 */

#include	<string.h>
#include	<stdio.h>
#include	<stdlib.h>
#include	<ctype.h>
#include	<acs.h>
#ifndef __ACS_MODULE__
#include	<acsplus.h>
#endif
#include	"kobold_2.h"

#define	WIDTH		(72)
#define	HEIGHT	(40)

#define LINE_LEN	(128)
#define PATH_LEN	(512)
#define BUFFER		(16384)
#define FILE_LEN	(13)

#include "acs230.h"
#include	"datei2.h"

/*****************************************/
/* Variablen *****************************/
static OBJECT back;
static OBJECT files;
static OBJECT dirs;
static AOBJECT back0;
static AOBJECT files0;
static AOBJECT dirs0;
static OBJECT *ob;

#include	"datei2.ah"

/* Window-Closed-Routine */
static void close_file(Awindow *wi)
{
	DIR_INFO *user;

	user = wi->user;
	if (ACSblk->appexit || ACSblk->ev_mmokstate & K_CTRL)
		Awi_closed(wi);
	else
	{
		if (ACSblk->ev_mmokstate & K_ALT)
		{
			Dsetdrv(user->act_drive);
			Dsetpath("\\");
			make_work(wi);
		} else
		{
			if ((int16) strlen(user->path) > 1)
			{
				Dsetdrv(user->act_drive);
				Dsetpath("..");
				make_work(wi);
			} else
				Awi_closed(wi);
		}
	}
}

static int cmp_file(const void *a, const void *b)
{
	uint16 lena, lenb, i;
	char *ta = (*((const A_FileList **) a))->file;
	char *tb = (*((const A_FileList **) b))->file;

	if (NULL == ta || NULL == tb)
		return 0;
	lena = (uint16) strlen(ta) + 1;
	lenb = (uint16) strlen(tb) + 1;
	lena = min(lena, lenb);
	for (i = 0; i < lena; i++)
	{
		if (ta[i] < tb[i])
			return -1;
		if (ta[i] > tb[i])
			return 1;
	}
	return 0;
}

#define PSRC		(0)
#define PDEST		(1)
#define PSRC2		(2)
#define PDEST2	(3)
#define PDESTT	(4)
#define PMASK		(5)
#define PCOUNT	(6)

/***********************************************/
/* kopiert/verschiebt eine Datei SRC nach DEST */
static int16 copy(char *osrc, char *odest, int16 kstate)
{
	char *mem;
	char *path[6];
	char str[LINE_LEN];
	long s_id;
	long d_id;
	long s_len;
	long d_len;
	long b_len;
	int16 key;
	int16 error = 1;
	A_FileList *act;
	A_FileList *list;

	/*** dynamisch Pfadpuffer holen ***/
	if (NULL == (path[0] = Ax_malloc(PATH_LEN * PCOUNT)))
		goto ERCOPY;
	/*** Zeiger verteilen ***/
	for (key = 1; key < PCOUNT; key++)
		path[key] = path[0] + key * PATH_LEN;

	strcpy(path[PSRC], osrc);
	strcpy(path[PDEST], odest);
	ACSblk->alert_name = ALERT_TITEL;

	switch ((int) Af_length(path[PSRC]))
	{
	case -2L:			/*** nix gefunden ***/
		break;

	case -1L:			/*** ein Ordner ***/
		Amo_busy();
		strcpy(path[PSRC2], path[PSRC]);
		strcpy(path[PDEST2], path[PDEST]);
		trim_dest(path[PSRC2], path[PDEST2]);
		path[PDEST2][strlen(path[PDEST2]) - 1] = EOS;
		if (Af_length(path[PDEST2]) != 0L)							/*** Ziel anlegen ***/
			if ((int) Dcreate(path[PDEST2]) < 0)
			{
				Amo_unbusy();
				ACSblk->ACSerror(AE_CREATE_IO, Af_2fullname(str, path[PDEST2]));
				goto ERCOPY;
			}
		strcat(path[PDEST2], "\\");
		strcpy(path[PDESTT], path[PDEST2]);
		strcpy(path[PMASK], path[PSRC2]);						/*** Quellen einlesen ***/
		if (NULL != (list = act = Af_readdir(path[PMASK])))
		{
			act = list;
			while (act)
			{
				strcat(strcpy(path[PSRC2], path[PMASK]), act->file);
				strcpy(path[PDEST2], path[PDESTT]);
				if (copy(path[PSRC2], path[PDEST2], kstate))
					goto ERCOPY;
				act = act->next;
			}
			Af_freedir(list);
		}
		if (kstate & 0x4)
		{
			if (path[PSRC][strlen(path[PSRC]) - 1] == DIR)
				path[PSRC][strlen(path[PSRC]) - 1] = EOS;
			if ((int) Ddelete(path[PSRC]))
			{
				Amo_unbusy();
				alert_str(A_NOTDEL, Af_2fullname(str, path[PSRC]));
				goto ERCOPY;
			}
		}
		Amo_unbusy();
		break;

	default:			/*** Datei kopieren ***/
		Aob_puttext(ob, DA_TEXT, Af_2fullname(str, path[PSRC]));
		Amo_hide();
		objc_draw(ob, 0, MAX_DEPTH, ob->ob_x, ob->ob_y, ob->ob_width, ob->ob_height);
		Amo_show();
		strcat(path[PDEST], Af_2fullname(str, path[PSRC]));
		Amo_busy();
		if (0L > (s_id = Fopen(path[PSRC], FO_READ)))
		{
			Amo_unbusy();
			ACSblk->ACSerror(AE_OPEN_IO, Af_2fullname(str, path[PSRC]));
			goto ERCOPY;
		}
		s_len = Fseek(0L, (int16) s_id, 2);
		Fseek(0L, (int16) s_id, 0);
		if (NULL == (mem = Ax_malloc(s_len)))		/*** als Ganzes oder in Blöcken kopieren ***/
		{
			if (NULL == (mem = Ax_malloc(BUFFER)))
			{
				Amo_unbusy();
				Fclose((int16) s_id);
				ACSblk->ACSerror(AE_OUT_OF_MEM, NULL);
				goto ERCOPY;
			} else
				b_len = BUFFER;
		} else
			b_len = s_len;

		if (Af_length(path[PDEST]) > 0L)					/*** existierendes Ziel löschen ***/
		{
			Amo_unbusy();
			if (alert_str(A_FILEDEL, Af_2fullname(str, path[PDEST])) == 1)
			{
				if ((int) Fdelete(path[PDEST]))
				{
					Fclose((int16) s_id);
					Ax_ifree(mem);
					alert_str(A_NOTDEL, Af_2fullname(str, path[PDEST]));
					goto ERCOPY;
				}
				Amo_busy();
			} else
			{
				Fclose((int16) s_id);
				Ax_ifree(mem);
				goto ERCOPY;
			}
		}
		if (0L > (d_id = Fcreate(path[PDEST], 0)))
		{
			Amo_unbusy();
			Fclose((int16) s_id);
			Ax_ifree(mem);
			ACSblk->ACSerror(AE_CREATE_IO, Af_2fullname(str, path[PDEST]));
			goto ERCOPY;
		}
		while (s_len > 0)													/*** kopieren ***/
		{
			d_len = Fread((int16) s_id, b_len, mem);
			if (d_len < 0)
			{
				Amo_unbusy();
				Fclose((int16) s_id);
				Fclose((int16) d_id);
				Fdelete(path[PDEST]);
				Ax_ifree(mem);
				ACSblk->ACSerror(AE_READ_IO, Af_2fullname(str, path[PSRC]));
				goto ERCOPY;
			}
			if (Fwrite((int16) d_id, b_len, mem) != b_len)
			{
				Amo_unbusy();
				Ax_ifree(mem);
				Fclose((int16) s_id);
				Fclose((int16) d_id);
				Fdelete(path[PDEST]);
				ACSblk->ACSerror(AE_WRITE_IO, NULL);
				goto ERCOPY;
			}
			s_len -= b_len;
			b_len = min(b_len, s_len);
		}
		Fclose((int16) s_id);
		Fclose((int16) d_id);
		Ax_ifree(mem);
		Amo_unbusy();

		if (kstate & 0x4)										/*** verschieben? ***/
			if ((int) Fdelete(path[PSRC]))
			{
				alert_str(A_NOTDEL, Af_2fullname(str, path[PSRC]));
				goto ERCOPY;
			}
	}
	vq_key_s(ACSblk->vdi_handle, &key);
	if (key & K_LSHIFT && Awi_alert(1, A_ASKSTOP) == 1)
		goto ERCOPY;

	error = 0;
  ERCOPY:
	Ax_free(path[0]);
	ACSblk->alert_name = NULL;
	return error;
}

/*****************************************/
/* l�scht Datei SRC **********************/
static int16 delete(char *src)
{
	char s[PATH_LEN];
	char h[PATH_LEN];
	char str[LINE_LEN];
	A_FileList *act;
	A_FileList *list;
	int16 key;
	int16 error = 1;

	ACSblk->alert_name = ALERT_TITEL;
	switch ((int) Af_length(src))
	{
	case -2L:
		break;
	case -1L:						/*** Ordner ***/
		strcpy(s, src);
		if (s[strlen(s) - 1] != DIR)
			strcat(s, "\\");			/* hinten \ ran */
		strcpy(h, s);

		if (NULL != (list = act = Af_readdir(s)))
		{
			while (act)
			{
				strcat(strcpy(s, h), act->file);
				if (delete(s))
					goto ERDELETE;
				act = act->next;
			}
			Af_freedir(list);
		}

		strcpy(s, h);
		s[strlen(s) - 1] = EOS;
		Aob_puttext(ob, DA_TEXT, Af_2fullname(str, s));
		Amo_hide();
		objc_draw(ob, 0, MAX_DEPTH, ob->ob_x, ob->ob_y, ob->ob_width, ob->ob_height);
		Amo_show();
		Ddelete(s);
		break;

	default:				/*** Datei ***/
		Aob_puttext(ob, DA_TEXT, Af_2fullname(str, src));
		Amo_hide();
		objc_draw(ob, 0, MAX_DEPTH, ob->ob_x, ob->ob_y, ob->ob_width, ob->ob_height);
		Amo_show();
		if ((int) Fdelete(src))
		{
			alert_str(A_NOTDEL, Af_2fullname(str, src));
			goto ERDELETE;
		}
	}
	vq_key_s(ACSblk->vdi_handle, &key);
	if (key & K_LSHIFT && Awi_alert(1, A_ASKSTOP) == 1)
		goto ERDELETE;

	error = 0;
  ERDELETE:
	ACSblk->alert_name = NULL;
	return error;
}

static void do_back(void)
{
	OBJECT *pop;

	if (ACSblk->ev_object[ACSblk->ev_obnr].ob_state & AOS_DCLICK)
	{
		if (NULL == (pop = Aob_create(&P_BACK.root)))
			return;
		if (!ACSblk->Aselect.actlen)
			pop[PB_DEL].ob_state |= DISABLED;
		Ame_popup(ACSblk->ev_window, pop, -1, -1);
		Aob_delete(pop);
	} else
		Adr_box(ACSblk->ev_mmox, ACSblk->ev_mmoy);
}

static void do_file(void)
{
	AOBJECT *aob;
	Awindow *lz_toolbar = NULL;

	if (ACSblk->ev_object[ACSblk->ev_obnr].ob_state & AOS_DCLICK)
	{
		if (ACSblk->ev_mmokstate & (K_LSHIFT | K_RSHIFT))
			popup(ACSblk->ev_window);
		else
		{
			aob = (AOBJECT *) ACSblk->ev_object + ACSblk->ev_obnr + 1;
			if (!aob || !aob->userp1)
				return;
			Awi_sendall(AS_ASKLAZY, &lz_toolbar);
			if (lz_toolbar)
				(lz_toolbar->service) (lz_toolbar, AS_LOADFILE, aob->userp1);
			else
				Awi_sendall(AS_LOADFILE, aob->userp1);
		}
	}
}

static void drag_dir(void)
{
	Awindow *from;
	Awindow *lz_toolbar = NULL;
	AOBJECT *aob;
	int16 obnr;
	char src[PATH_LEN];
	char dest[PATH_LEN];
	DIR_INFO *user;
	ICONBLK *i;

	from = ACSblk->Aselect.window;
	user = ACSblk->ev_window->user;
	Adr_start();
	aob = NULL;
	while ((obnr = Adr_next()) >= 0)
	{
		if (obnr & A_TOOLBAR)
			aob = (AOBJECT *) from->toolbar + (obnr & A_MASK) + 1;
		else
			aob = (AOBJECT *) from->work + obnr + 1;
		if ((aob->type == AT_FILE) || (aob->type == AT_ARCHIVE))
			break;
	}
	if (aob != NULL && aob->type == AT_FILE)
	{
		if (ACSblk->ev_mmokstate & K_CTRL)
			strcpy(src, "verschieben?");
		else
			strcpy(src, "kopieren?");
		if (alert_str(A_ASKDO, src) == 1)
		{
			strcpy(src, "A:");
			*src += user->act_drive;
			strcpy(src + 2, user->path);
			strcat(src, "\\");
			i = (ACSblk->ev_object + ACSblk->ev_obnr)->ob_spec.iconblk;
			strcat(src, i->ib_ptext);
			strcat(src, "\\");
			if (appl_find("KOBOLD_2") < 0 || !drag_kobold(from, src, ACSblk->ev_mmokstate))	/* Kobold ran... */
			{
				ob = Aob_create(&D_ACTION.root);
				Aob_fix(ob);
				Aob_puttext(ob, DA_TEXT, "");
				form_center(ob, &ob->ob_x, &ob->ob_y, &ob->ob_width, &ob->ob_height);
				Amo_hide();
				form_dial(FMD_START, ob->ob_x, ob->ob_y, ob->ob_width, ob->ob_height, ob->ob_x, ob->ob_y, ob->ob_width,
						  ob->ob_height);
				objc_draw(ob, 0, MAX_DEPTH, ob->ob_x, ob->ob_y, ob->ob_width, ob->ob_height);
				Amo_show();
				while (obnr >= 0)
				{
					aob = (AOBJECT *) from->work + obnr + 1;
					if (aob->type == AT_FILE && aob->userp1)
					{
						strcpy(src, aob->userp1);
						strcpy(dest, "A:");
						*dest += user->act_drive;
						strcpy(dest + 2, user->path);
						strcat(dest, "\\");
						i = (ACSblk->ev_object + ACSblk->ev_obnr)->ob_spec.iconblk;
						strcat(dest, i->ib_ptext);
						strcat(dest, "\\");
						if (copy(src, dest, ACSblk->ev_mmokstate))
							break;
						if (!(ACSblk->ev_mmokstate & K_CTRL))
							Adr_del(from, obnr);
					}
					obnr = Adr_next();
				}
				form_dial(FMD_FINISH, ob->ob_x, ob->ob_y, ob->ob_width, ob->ob_height, ob->ob_x, ob->ob_y, ob->ob_width,
						  ob->ob_height);
				Aob_delete(ob);
			}
			if (ACSblk->ev_mmokstate & K_CTRL)
				(from->service) (from, AS_REDRAWFILE, ACSblk->ev_window);
			make_work(ACSblk->ev_window);
		}
	}
	if (aob != NULL && aob->type == AT_ARCHIVE)
	{
		strcpy(dest, "A:");
		*dest += user->act_drive;
		strcpy(dest + 2, user->path);
		strcat(dest, "\\");
		i = (ACSblk->ev_object + ACSblk->ev_obnr)->ob_spec.iconblk;
		strcat(dest, i->ib_ptext);
		strcat(dest, "\\");
		Awi_sendall(AS_ASKLAZY, &lz_toolbar);
		if (lz_toolbar)
			(lz_toolbar->service) (lz_toolbar, AS_DOARCHIVE, dest);
	}
}

static void drag_dotdot(void)
{
	Awindow *from;
	Awindow *lz_toolbar = NULL;
	AOBJECT *aob;
	int16 obnr;
	char src[PATH_LEN];
	char dest[PATH_LEN];
	char *p;
	DIR_INFO *user;

	from = ACSblk->Aselect.window;
	user = ACSblk->ev_window->user;
	Adr_start();
	aob = NULL;
	while ((obnr = Adr_next()) >= 0)
	{
		if (obnr & A_TOOLBAR)
			aob = (AOBJECT *) from->toolbar + (obnr & A_MASK) + 1;
		else
			aob = (AOBJECT *) from->work + obnr + 1;
		if (aob->type == AT_FILE || aob->type == AT_ARCHIVE)
			break;
	}
	if (aob != NULL && aob->type == AT_FILE)
	{
		if (ACSblk->ev_mmokstate & K_CTRL)
			strcpy(src, "verschieben?");
		else
			strcpy(src, "kopieren?");
		if (alert_str(A_ASKDO, src) == 1)
		{
			strcpy(src, "A:");
			*src += user->act_drive;
			strcpy(src + 2, user->path);
			p = strrchr(src, '\\');
			if (p)
				p[1] = EOS;
			if (appl_find("KOBOLD_2") < 0 || !drag_kobold(from, src, ACSblk->ev_mmokstate))
			{
				ob = Aob_create(&D_ACTION.root);
				Aob_fix(ob);
				Aob_puttext(ob, DA_TEXT, "");
				form_center(ob, &ob->ob_x, &ob->ob_y, &ob->ob_width, &ob->ob_height);
				Amo_hide();
				form_dial(FMD_START, ob->ob_x, ob->ob_y, ob->ob_width, ob->ob_height, ob->ob_x, ob->ob_y, ob->ob_width,
						  ob->ob_height);
				objc_draw(ob, 0, MAX_DEPTH, ob->ob_x, ob->ob_y, ob->ob_width, ob->ob_height);
				Amo_show();
				while (obnr >= 0)
				{
					aob = (AOBJECT *) from->work + obnr + 1;
					if (aob->type == AT_FILE && aob->userp1)
					{
						strcpy(src, aob->userp1);
						strcpy(dest, "A:");
						*dest += user->act_drive;
						strcpy(dest + 2, user->path);
						p = strrchr(dest, '\\');
						if (p != NULL)
							*(p + 1) = EOS;
						if (copy(src, dest, ACSblk->ev_mmokstate))
							break;
						if (!(ACSblk->ev_mmokstate & K_CTRL))
							Adr_del(from, obnr);
					}
					obnr = Adr_next();
				}
				form_dial(FMD_FINISH, ob->ob_x, ob->ob_y, ob->ob_width, ob->ob_height, ob->ob_x, ob->ob_y, ob->ob_width,
						  ob->ob_height);
				Aob_delete(ob);
			}
			if (ACSblk->ev_mmokstate & K_CTRL)
				(from->service) (from, AS_REDRAWFILE, ACSblk->ev_window);
			make_work(ACSblk->ev_window);
		}
	}
	if (aob != NULL && aob->type == AT_ARCHIVE)
	{
		strcpy(dest, "A:");
		*dest += user->act_drive;
		strcpy(dest + 2, user->path);
		p = strrchr(dest, '\\');
		if (p != NULL)
			*(p + 1) = EOS;
		Awi_sendall(AS_ASKLAZY, &lz_toolbar);
		if (lz_toolbar)
			(lz_toolbar->service) (lz_toolbar, AS_DOARCHIVE, dest);
	}
}

static void drag_drive(void)
{
	Awindow *from;
	Awindow *lz_toolbar = NULL;
	AOBJECT *aob;
	int16 obnr;
	char *ptr;
	char src[PATH_LEN];
	char dest[PATH_LEN];
	DIR_INFO *user;

	from = ACSblk->Aselect.window;
	user = ACSblk->ev_window->user;
	Auo_cycle(ACSblk->ev_window->toolbar + DT_DRV, AUO_GETVAL, &ptr);
	Adr_start();
	aob = NULL;
	while ((obnr = Adr_next()) >= 0)
	{
		if (obnr & A_TOOLBAR)
			aob = (AOBJECT *) from->toolbar + (obnr & A_MASK) + 1;
		else
			aob = (AOBJECT *) from->work + obnr + 1;
		if (aob->type == AT_FILE || aob->type == AT_ARCHIVE)
			break;
	}
	if (aob != NULL && aob->type == AT_FILE)
	{
		if (ACSblk->ev_mmokstate & K_CTRL)
			strcpy(src, "verschieben?");
		else
			strcpy(src, "kopieren?");
		if (alert_str(A_ASKDO, src) == 1)
		{
			strcpy(src, "A:\\");
			if (ACSblk->ev_window->wi_id >= 0)
				src[0] = ptr[2];
			else
				*src += user->act_drive;
			if (appl_find("KOBOLD_2") < 0 || !drag_kobold(from, src, ACSblk->ev_mmokstate))
			{
				ob = Aob_create(&D_ACTION.root);
				Aob_fix(ob);
				Aob_puttext(ob, DA_TEXT, "");
				form_center(ob, &ob->ob_x, &ob->ob_y, &ob->ob_width, &ob->ob_height);
				Amo_hide();
				form_dial(FMD_START, ob->ob_x, ob->ob_y, ob->ob_width, ob->ob_height, ob->ob_x, ob->ob_y, ob->ob_width,
						  ob->ob_height);
				objc_draw(ob, 0, MAX_DEPTH, ob->ob_x, ob->ob_y, ob->ob_width, ob->ob_height);
				Amo_show();
				while (obnr >= 0)
				{
					aob = (AOBJECT *) from->work + obnr + 1;
					if (aob->type == AT_FILE && aob->userp1)
					{
						strcpy(src, aob->userp1);
						strcpy(dest, "A:\\");
						if (ACSblk->ev_window->wi_id >= 0)
							dest[0] = ptr[2];
						else
							*dest += user->act_drive;
						if (copy(src, dest, ACSblk->ev_mmokstate))
							break;
						if (!(ACSblk->ev_mmokstate & K_CTRL))
							Adr_del(from, obnr);
					}
					obnr = Adr_next();
				}
				form_dial(FMD_FINISH, ob->ob_x, ob->ob_y, ob->ob_width, ob->ob_height, ob->ob_x, ob->ob_y, ob->ob_width,
						  ob->ob_height);
				Aob_delete(ob);
			}
			if (ACSblk->ev_mmokstate & K_CTRL)
				(from->service) (from, AS_REDRAWFILE, ACSblk->ev_window);
			if (ACSblk->ev_window->wi_id >= 0)
				make_work(ACSblk->ev_window);
		}
	}
	if (aob != NULL && aob->type == AT_ARCHIVE)
	{
		strcpy(dest, "X:\\");
		dest[0] = ptr[2];
		Awi_sendall(AS_ASKLAZY, &lz_toolbar);
		if (lz_toolbar)
			(lz_toolbar->service) (lz_toolbar, AS_DOARCHIVE, dest);
	}
}

static void drag_file(void)
{
	Awindow *from;
	Awindow *lz_toolbar = NULL;
	AOBJECT *aob;
	int16 obnr;
	char src[PATH_LEN];
	char dest[PATH_LEN];
	DIR_INFO *user;

	from = ACSblk->Aselect.window;
	user = ACSblk->ev_window->user;
	Adr_start();
	aob = NULL;
	while ((obnr = Adr_next()) >= 0)
	{
		if (obnr & A_TOOLBAR)
			aob = (AOBJECT *) from->toolbar + (obnr & A_MASK) + 1;
		else
			aob = (AOBJECT *) from->work + obnr + 1;
		if (aob->type == AT_FILE || aob->type == AT_ARCHIVE)
			break;
	}
	if (aob != NULL && aob->type == AT_FILE)
	{
		if (ACSblk->ev_mmokstate & K_CTRL)
			strcpy(src, "verschieben?");
		else
			strcpy(src, "kopieren?");
		if (alert_str(A_ASKDO, src) == 1)
		{
			strcpy(src, "A:");
			*src += user->act_drive;
			strcpy(src + 2, user->path);
			strcat(src, "\\");
			if (appl_find("KOBOLD_2") < 0 || !drag_kobold(from, src, ACSblk->ev_mmokstate))
			{
				ob = Aob_create(&D_ACTION.root);
				Aob_fix(ob);
				Aob_puttext(ob, DA_TEXT, "");
				form_center(ob, &ob->ob_x, &ob->ob_y, &ob->ob_width, &ob->ob_height);
				Amo_hide();
				form_dial(FMD_START, ob->ob_x, ob->ob_y, ob->ob_width, ob->ob_height, ob->ob_x, ob->ob_y, ob->ob_width,
						  ob->ob_height);
				objc_draw(ob, 0, MAX_DEPTH, ob->ob_x, ob->ob_y, ob->ob_width, ob->ob_height);
				Amo_show();
				while (obnr >= 0)
				{
					aob = (AOBJECT *) from->work + obnr + 1;
					if (aob->type == AT_FILE && aob->userp1)
					{
						strcpy(src, aob->userp1);
						strcpy(dest, "A:");
						*dest += user->act_drive;
						strcpy(dest + 2, user->path);
						strcat(dest, "\\");
						if (copy(src, dest, ACSblk->ev_mmokstate))
							break;
						if (!(ACSblk->ev_mmokstate & K_CTRL))
							Adr_del(from, obnr);
					}
					obnr = Adr_next();
				}
				form_dial(FMD_FINISH, ob->ob_x, ob->ob_y, ob->ob_width, ob->ob_height, ob->ob_x, ob->ob_y, ob->ob_width,
						  ob->ob_height);
				Aob_delete(ob);
			}
			if (ACSblk->ev_mmokstate & K_CTRL)
				(from->service) (from, AS_REDRAWFILE, ACSblk->ev_window);
			make_work(ACSblk->ev_window);
		}
	}
	if (aob != NULL && aob->type == AT_ARCHIVE)
	{
		strcpy(dest, "A:");
		*dest += user->act_drive;
		strcpy(dest + 2, user->path);
		strcat(dest, "\\");
		Awi_sendall(AS_ASKLAZY, &lz_toolbar);
		if (lz_toolbar)
			(lz_toolbar->service) (lz_toolbar, AS_DOARCHIVE, dest);
	}
}

static int16 drag_kobold(Awindow * wi, char *src, int16 state)
{
	char *p;
	char str[PATH_LEN] = "";
	int16 obnr;
	int16 k;
	int16 buff[] = { 0, 0, 0, 0, 0, 0, 0, 0 };
	AOBJECT *aob;

	if (ACSblk->multitask)
		p = (char *)Mxalloc((ACSblk->Aselect.actlen + 2) * (PATH_LEN + 10), 0x42);
	else
		p = (char *)Malloc((ACSblk->Aselect.actlen + 2) * (PATH_LEN + 10));
	if (!p)
		return FALSE;
	Adr_start();
	obnr = Adr_next();
	aob = (AOBJECT *) wi->work + obnr + 1;
	if (aob->type != AT_FILE || !aob->userp1)
		return FALSE;
	strcpy(p, "#2=1\r\n#1 ");
	strcat(p, src);
	strcat(p, "\r\n");
	strcpy(str, "#0 ");
	strcpy(str + 3, aob->userp1);
	strcpy(str + 5, "\r\n");
	strcat(p, str);
	do
	{
		aob = (AOBJECT *) wi->work + obnr + 1;
		if (aob->type != AT_FILE || !aob->userp1)
			continue;
		strcpy(str + 3, aob->userp1);
		str[3] = '+';
		str[4] = ' ';
		k = (int16) strlen(str);
		if (str[k - 1] == '\\')
			str[k - 1] = EOS;
		strcat(str, "\r\n");
		strcat(p, str);
	}
	while ((obnr = Adr_next()) >= 0);
	if (state & 0x4)
		sprintf(str, "#13 #39\r\n");
	else
		sprintf(str, "#12 #39\r\n");
	strcat(p, str);
	buff[0] = KOBOLD_JOB_NO_WINDOW;
	buff[1] = ACSblk->gl_apid;
	buff[2] = 0;
	{
	char **pp = (char **)&buff[3];
	*pp = p;
	}
	Awi_update(RESET_UPDATE);
	appl_write(appl_find("KOBOLD_2"), 16, buff);
	do
	{
		evnt_mesag(buff);
		if (buff[0] != KOBOLD_ANSWER)
			appl_write(ACSblk->gl_apid, 16, buff);
	} while (buff[0] != KOBOLD_ANSWER);

	Mfree(p);

	if (buff[3] != KOB_FINISHED)		/* KOBOLD ist noch aktiv */
	{
		buff[0] = KOBOLD_CLOSE;			/* Message: Beenden */
		buff[1] = ACSblk->gl_apid;
		buff[2] = 0;
		appl_write(appl_find("KOBOLD_2"), 16, buff);
		do
		{
			evnt_mesag(buff);
			if (buff[0] != KOBOLD_ANSWER)
				appl_write(ACSblk->gl_apid, 16, buff);
		} while (buff[0] != KOBOLD_ANSWER);

		if (buff[3] > 0)				/* Fehler */
		{
			Awi_update(RESTART_UPDATE);
			return FALSE;
		}
	}
	Awi_update(RESTART_UPDATE);
	return TRUE;
}

/*****************************************/
/* findet Datei PATH *********************/
/* -> 1=BREAK ****************************/
/* ->-1=FOUND ****************************/
/* -> 0=NOT-Found ************************/
static int16 find(char *path)
{
	char s[PATH_LEN];
	char h[PATH_LEN];
	char *p;
	A_FileList *act;
	A_FileList *list;
	int16 key;
	int16 ok = 0;
	int16 i;
	int16 last;
	ICONBLK *icn;

	strcpy(s, path);
	if (Af_length(path) < 0L || NULL == (p = strrchr(s, DIR)))
		return 0;
	ACSblk->alert_name = ALERT_TITEL;
	*p = EOS;
	(ACSblk->ev_window->service) (ACSblk->ev_window, AS_REDRAWFILE, NULL);
	last = ACSblk->ev_window->work[0].ob_tail;
	for (i = 2; i <= last; i += 2)
	{
		icn = ((ACSblk->ev_window->work) + i)->ob_spec.iconblk;
		if (!strcmp(icn->ib_ptext, p + 1))
		{
			Adr_add(ACSblk->ev_window, i);
			break;
		}
	}
	if (Awi_alert(1, A_FOUND) == 2)
	{
		ACSblk->alert_name = NULL;
		return -1;
	}

	if (NULL != (list = act = Af_readdir(s)))
	{
		while (act)
		{
			if (act->file[strlen(act->file) - 1] == DIR)
			{
				strcat(strcat(strcat(strcat(strcpy(h, s), "\\"), act->file), "\\"), p + 1);
				if (-1 == (ok = find(h)))
					break;
			}
			act = act->next;
		}
	}
	Af_freedir(list);
	vq_key_s(ACSblk->vdi_handle, &key);
	if (key & K_LSHIFT)
		if (form_alert(1, A_ASKSTOP) == 1)
		{
			ACSblk->alert_name = NULL;
			return 1;
		}
	ACSblk->alert_name = NULL;
	return ok;
}

/*********************************************************/
/* DateInfo-Returnwert 0, wenn weiter, sonst was anderes */
static int16 info(char *src)
{
	Awindow *dia;
	DOSTIME dattime;
	int16 newattr;
	int16 attr;
	int16 temp;
	int16 ret = 0;
	int16 dir_flag = TRUE;
	long len;
	long fid;
	char name[30];
	char new[30];
	char str[PATH_LEN];
	char *ptr;

	if (-1L > (len = Af_length(src)))
		return 1;
	if (NULL == (dia = F_INFOFILE.create(&F_INFOFILE)))
		return 1;
	if (NULL != (ptr = strrchr(src, DIR)) && ptr[1] == EOS)
		*ptr = EOS;
	if (strcmp(Af_2fullname(str, src), ".") && strcmp(str, ".."))
	{
		if (len >= 0L)
		{
			dia->work[I_PATH].ob_flags |= HIDETREE;
			dir_flag = FALSE;
			Aob_printf(dia->work, I_LEN, "%09ld", len);
		} else
			Aob_puttext(dia->work, I_LEN, "---------");

		if (0L <= len && 0L < (fid = Fopen(src, FO_READ)))
		{
			Fdatime(&dattime, (int) fid, 0);
			Fclose((int16) fid);
			Aob_printf(dia->work, I_DATE, "%02d%02d%4d",
					   dattime.date & 0x1F, (dattime.date >> 5) & 0xF, ((dattime.date >> 9) & 0x7F) + 1980);
			Aob_printf(dia->work, I_TIME, "%02d%02d%02d",
					   (dattime.time >> 11) & 0x1F, (dattime.time >> 5) & 0x3F, 2 * (dattime.time & 0x1F));
		} else
		{
			Aob_puttext(dia->work, I_DATE, "---------");
			Aob_printf(dia->work, I_TIME, "------");
		}
		attr = Fattrib(src, 0, temp);
		Af_2fullname(name, src);
		Aob_puttext(dia->work, I_NAME, name);
		if (attr & FA_READONLY)
			dia->work[S_PROTECT].ob_state |= SELECTED;
		if (attr & FA_HIDDEN)
			dia->work[S_HIDDEN].ob_state |= SELECTED;
		if (attr & FA_SYSTEM)
			dia->work[S_SYSTEM].ob_state |= SELECTED;
		if (attr & FA_ARCHIVE)
			dia->work[S_ARCHIV].ob_state |= SELECTED;
		if (dir_flag && tos_version() < 0x0104L)
			dia->work[I_NAME].ob_flags &= ~EDITABLE;
		switch (Awi_dialog(dia))
		{
		case I_CANCEL:
			ret = 1;
			break;
		case I_JUMP:
			ret = 0;
			break;
		case I_OK:
			if (dir_flag && tos_version() < 0x0104L)
				break;
				/*** Attribute ***/
			newattr = 0;
			if (dia->work[S_PROTECT].ob_state & SELECTED)
				newattr |= FA_READONLY;
			if (dia->work[S_HIDDEN].ob_state & SELECTED)
				newattr |= FA_HIDDEN;
			if (dia->work[S_SYSTEM].ob_state & SELECTED)
				newattr |= FA_SYSTEM;
			if (dia->work[S_ARCHIV].ob_state & SELECTED)
				newattr |= FA_ARCHIVE;
			if (newattr != attr)
				Fattrib(src, 1, newattr);
				/*** Name ***/
			Aob_gettext(dia->work, I_NAME, new);
			if (*new && strcmp(name, new))
				Frename(0, src, new);
			ret = 0;
			break;
		}
	}
	if (ptr)
		*ptr = DIR;
	Awi_delete(dia);
	return ret;
}

static int16 key_file(Awindow * wi, int16 kstate, int16 key)
{
	Awindow *to_win = NULL;

	if (key < 0)
	{
		switch ((char) key)
		{
		case 'A':						/* alles auswählen */
			me_all(wi);
			break;
		case NK_BS:					/* eine Ebene Höher */
			if (key & NKF_CTRL)
				(wi->closed) (wi);
			break;
		case NK_ESC:					/* Inhalt neu aufbauen */
			(wi->service) (wi, AS_REDRAWFILE, wi);
			break;
		default:						/* sonst an LAZy weitergeben */
			Awi_sendall(AS_ASKLAZY, &to_win);
			if (to_win)
				(to_win->keys) (to_win, kstate, key);
			else
				Awi_keys(wi, kstate, key);
		}
	} else
		Awi_keys(wi, kstate, key);
	return -1;
}

#ifdef __PUREC__
#pragma warn -par
#endif

static Awindow *make_file(void *para)
{
	Awindow *wi;
	DIR_INFO *user;
	int16 i;
	char popstr[PATH_LEN] = "";
	char *ptr;

	if (NULL == (wi = Awi_create((Awindow *) & F_DIR)) || NULL == (user = Ax_malloc(sizeof(DIR_INFO))))
		return NULL;
	wi->user = user;
	user->act_drive = Dgetdrv();
	user->drives = Dsetdrv(user->act_drive);
	user->path[0] = EOS;

	ptr = &popstr[2];
	for (i = 0; i < 32; i++)
		if ((1L << i) & user->drives)
		{
			if (*popstr)
				strcat(popstr, "|");
			strcat(popstr, "  A:  ");
			*ptr += i;
			ptr += 7;
		}
	Auo_cycle(wi->toolbar + DT_DRV, AUO_CYCPOPUP, popstr);
	strcpy(popstr, "  A:  ");
	popstr[2] += user->act_drive;
	Auo_cycle(wi->toolbar + DT_DRV, AUO_SETVAL, popstr);
	make_work(wi);
	(wi->open) (wi);

	return wi;
}

#ifdef __PUREC__
#pragma warn .par
#endif

static void make_work(Awindow * window)
{
	DIR_INFO *user;
	A_FileList *list;
	A_FileList *act;
	A_FileList **table;
	OBJECT *work;
	OBJECT *oldwork;
	AOBJECT *aob;
	char path[PATH_LEN];
	char *ptr;
	int16 t;
	int16 k;
	int16 scw;
	int16 count_ob;
	uint16 i;
	uint16 maxlen;

	Amo_busy();
	user = window->user;

	if (ACSblk->Aselect.actlen > 0 && ACSblk->Aselect.window == window)
		Adr_unselect();

	strcpy(path, "A:");
	*path += user->act_drive;
	Dgetpath(&path[2], ((int16) path[0]) + 1 - 'A');

	if (NULL == (list = act = Af_readdir(path)))
	{
		Amo_unbusy();
		return;
	}
	maxlen = count_ob = 0;
	while (act)
	{
		count_ob++;
		ptr = strrchr(act->file, DIR);
		if (ptr[1] == EOS)
			*ptr = EOS;
		else
			ptr = NULL;
		i = (int16) strlen(strrchr(act->file, DIR) + 1);
		if (ptr)
			*ptr = DIR;
		if (i > maxlen)
			maxlen = i;
		act = act->next;
	}
	act = list;
	count_ob++;

	if (NULL == (work = Ax_malloc((count_ob << 1) * sizeof(AOBJECT))))
	{
		Amo_unbusy();
		Af_freedir(list);
		return;
	}

	Ast_delete(window->name);
	window->name = Ast_create(path);
	if (window->wi_id > 0)
		wind_set(window->wi_id, WF_NAME, window->name);
	strcpy(user->path, &path[2]);

	if (NULL != (oldwork = window->work))
	{
		for (i = oldwork[0].ob_head; i > 0; i = oldwork[i].ob_next)
		{
			aob = (AOBJECT *) oldwork + i + 1;
			if (aob->ob_flags & AEO && aob->type == AT_FILE && aob->userp1)
				Ast_delete(aob->userp1);
		}
		Aob_delete(oldwork);
	}

	window->work = work;

	memcpy(work, &back, sizeof(OBJECT));	/* Hintergrund */
	memcpy(work + 1, &back0, sizeof(AOBJECT));
	if (count_ob > 1)
	{
		work->ob_head = 2;
		work += 2;
		i = 4;

		vst_font(ACSblk->vdi_handle, ACSblk->fontsid);
		vst_height(ACSblk->vdi_handle, ACSblk->fsheight, &t, &t, &scw, &t);
		maxlen *= (uint16) scw;

		dirs.ob_spec.iconblk->ib_wtext = maxlen;
		files.ob_spec.iconblk->ib_wtext = maxlen;
/*
		dirs.ob_width = maxlen;
		files.ob_width = maxlen;
*/
		if (maxlen > dirs.ob_spec.iconblk->ib_wicon)
			dirs.ob_spec.iconblk->ib_xicon = (maxlen - dirs.ob_spec.iconblk->ib_wicon) >> 1;
		if (maxlen > files.ob_spec.iconblk->ib_wicon)
			files.ob_spec.iconblk->ib_xicon = (maxlen - files.ob_spec.iconblk->ib_wicon) >> 1;

		if (NULL != (table = Ax_malloc(sizeof(A_FileList *) * (count_ob - 1))))
		{
			t = 0;
			while (act)
			{
				table[t++] = act;
				act = act->next;
			}
			k = t;
			qsort(table, t, sizeof(A_FileList *), cmp_file);
			act = list = table[0];
			for (t = 1; t < k; t++)
			{
				act->next = table[t];
				act = act->next;
			}
			act->next = NULL;
			Ax_ifree(table);
		}

		/*****************************************/
		/*  Dirs    ******************************* */
		act = list;
		while (act)
		{
			if (act->file[t = strlen(act->file) - 1] == DIR)
			{
				act->file[t] = EOS;
				dirs.ob_spec.iconblk->ib_ptext = strrchr(act->file, DIR) + 1;
				memcpy(work, &dirs, sizeof(OBJECT));
				memcpy(work + 1, &dirs0, sizeof(AOBJECT));
				work->ob_spec.ciconblk = Aic_create(work->ob_spec.ciconblk);
				act->file[t] = DIR;
				aob = (AOBJECT *) work + 1;
				aob->userp1 = Ast_create(act->file);

				if (ACSblk->nplanes >= 4 && ap_version > 0x0330)
				{
					work->ob_type &= ~0xFF;
					work->ob_type |= G_CICON;
				}
				work->ob_next = i;		/* work->ob_next = work->ob_tail = -1; */
				i += 2;
				work += 2;
			}
			act = act->next;
		}

		/*****************************************/
		/*  Files   ******************************* */
		act = list;
		while (act)
		{
			if (act->file[strlen(act->file) - 1] != DIR)
			{
				files.ob_spec.iconblk->ib_ptext = strrchr(act->file, DIR) + 1;
				memcpy(work, &files, sizeof(OBJECT));
				memcpy(work + 1, &files0, sizeof(AOBJECT));
				work->ob_spec.ciconblk = Aic_create(files.ob_spec.ciconblk);
				aob = (AOBJECT *) work + 1;
				aob->userp1 = Ast_create(act->file);
				aob->userp2 = (void *) Af_length(act->file);

				if (ACSblk->nplanes >= 4 && ap_version > 0x0330)
				{
					work->ob_type &= ~0xFF;
					work->ob_type |= G_CICON;
				}
				work->ob_next = i;		/* work->ob_head = work->ob_tail = -1; */
				i += 2;
				work += 2;
			}
			act = act->next;
		}

		(work - 2)->ob_next = 0;		/*  Aufräumen */
		(work - 1)->ob_flags |= LASTOB;
		window->work->ob_tail = i - 4;
		window->work[2].ob_x = window->work[2].ob_y = 1;
	} else								/* keine Kinder */
	{
		window->work->ob_head = window->work->ob_tail = window->work->ob_next = -1;
		window->work->ob_flags |= LASTOB;
	}
	Aob_fix(window->work);
	Af_freedir(list);

	if (!*user->path)
		window->toolbar[DT_RET].ob_flags |= HIDETREE;
	else
		window->toolbar[DT_RET].ob_flags &= ~HIDETREE;

	if (window->wi_id > 0)
	{
		window->state |= AWS_FORCEREDRAW;
		(window->sized) (window, &window->wi_act);
	}
	Amo_unbusy();
}

static void me_all(Awindow * wi)
{
	int16 i;
	int16 last;
	AOBJECT *aob;
	char *p;

	last = wi->work[0].ob_tail;
	for (i = 2; i <= last; i += 2)
	{
		aob = (AOBJECT *) wi->work + i + 1;
		if (aob->type != AT_FILE)
			continue;
		if (strlen(aob->userp1) <= 3)
			continue;
		p = strrchr(aob->userp1, '\\');
		if (p)
			if (!strcmp(p, "\\.."))
				continue;
		Adr_add(wi, i);
	}
}

static void new_dir(void)
{
	DIR_INFO *user;

	if (ACSblk->ev_object[ACSblk->ev_obnr].ob_state & AOS_DCLICK)
	{
		ACSblk->ev_object[ACSblk->ev_obnr].ob_state &= ~SELECTED;
		Adr_add(ACSblk->ev_window, ACSblk->ev_obnr);
		if (ACSblk->ev_mmokstate & (K_LSHIFT | K_RSHIFT))
			popup(ACSblk->ev_window);
		else
		{
			user = ACSblk->ev_window->user;
			Dsetdrv(user->act_drive);
			Dsetpath(user->path);
			Dsetpath(ACSblk->ev_object[ACSblk->ev_obnr].ob_spec.iconblk->ib_ptext);
			make_work(ACSblk->ev_window);
		}
	}
}

static void new_drive(void)
{
	DIR_INFO *user;
	OBJECT *cyc;
	char *next;

	user = ACSblk->ev_window->user;
	cyc = ACSblk->ev_object + (ACSblk->ev_obnr & A_MASK);
	Aus_cycle();
	Auo_cycle(cyc, AUO_GETVAL, &next);
	user->act_drive = next[2] - 'A';
	Dsetpath("\\");
	Dsetdrv(user->act_drive);
	make_work(ACSblk->ev_window);
}

static void pd_erase(void)
{
	(ACSblk->ev_window->service) (ACSblk->ev_window, AS_DELETE, NULL);
}

static void pd_find(void)
{
	Awindow *dia;
	DIR_INFO *user;
	char path[PATH_LEN];
	char name[30];
	int16 ok;

	if (NULL == (dia = F_FIND.create(&F_FIND)))
		return;
	user = ACSblk->ev_window->user;
	Aob_puttext(dia->work, DF_TXT, "");
	if (Awi_dialog(dia) == DF_OK)
	{
		Aob_gettext(dia->work, DF_TXT, name);
		if (*name)
		{
			strcpy(path, "A:");
			*path += user->act_drive;
			strcat(strcat(strcpy(path + 2, user->path), "\\"), name);
			ok = find(path);
			if (!ok)
			{
				ACSblk->alert_name = ALERT_TITEL;
				Awi_alert(1, A_NOTFOUND);
				ACSblk->alert_name = NULL;
			}
		}
	}
	Awi_delete(dia);
}

static void pd_info(void)
{
	(ACSblk->ev_window->service) (ACSblk->ev_window, AS_INFO, ACSblk->ev_window);
}

static void popup(Awindow * wi)
{
	OBJECT *pop;
	Axywh obxywh;

	if (NULL == (pop = Aob_create(&P_EXEC.root)))
		return;
	Aob_offset(&obxywh, wi->work, ACSblk->ev_obnr);
	Ame_popup(wi, pop, wi->wi_work.x + obxywh.x + obxywh.w, wi->wi_work.y + obxywh.y);
	Aob_delete(pop);
}

static void ret_dir(void)
{
	DIR_INFO *user;

	user = ACSblk->ev_window->user;
	Dsetdrv(user->act_drive);
	Dsetpath(user->path);
	Dsetpath("..");

	make_work(ACSblk->ev_window);
}

static boolean service_file(Awindow * wi, int16 task, void *in_out)
{
	AOBJECT *aob;
	int16 obnr;
	int16 i;
	int16 last;
	int16 buff[] = { 0, 0, 0, 0, 0, 0, 0, 0 };
	char src[PATH_LEN];
	char path[PATH_LEN];
	char str[PATH_LEN];
	char *p;
	char own[PATH_LEN];
	char winp[PATH_LEN];
	Awindow *from;
	Awindow *dia;
	long len = 0L;
	DIR_INFO *user;

	switch (task)
	{
	case AS_TERM:
		Awi_delete(wi);
#ifdef __ACS_MODULE__
		ACSmoduleterm();
#endif
		break;

	case AS_INFO:						/* Info zeigen */
		if (ACSblk->Aselect.actlen > 0)
		{
			Adr_start();
			while ((obnr = Adr_next()) >= 0)
			{
				aob = (AOBJECT *) wi->work + obnr + 1;
				if (aob->type == AT_FILE)
				{
					strcpy(src, aob->userp1);
					if (info(src))
						return TRUE;
					Adr_del(wi, obnr);
				}
			}
			make_work(wi);				/* Namen können sich geändert haben */
		} else
		{
			if (NULL != (dia = F_INFODATEI.create(&F_INFODATEI)))
			{
				Awi_dialog(dia);
				Awi_delete(dia);
			}
		}
		break;

	case AS_SELECTDEL:
	case AS_SELECTADD:
	case AS_REALSEL_UPDATE:
		if (ACSblk->Aselect.window != wi || !ACSblk->Aselect.actlen)
			setwininf(wi, DSEL_NONE);
		else
		{
			if (ACSblk->Aselect.actlen == 1)
			{
				Adr_start();
				aob = (AOBJECT *) wi->work + Adr_next() + 1;
				sprintf(str, DSEL_ONE, (long) aob->userp2);
				setwininf(wi, str);
			} else
			{
				Adr_start();
				while ((obnr = Adr_next()) >= 0)
				{
					aob = (AOBJECT *) wi->work + obnr + 1;
					len += (long) aob->userp2;
				}
				sprintf(str, DSEL_MULTI, ACSblk->Aselect.actlen, len);
				setwininf(wi, str);
			}
		}
		break;

	case AS_DELETE:
		if (ACSblk->Aselect.actlen > 0)	/* steht was drin? */
		{
			from = ACSblk->Aselect.window;
			ACSblk->alert_name = ALERT_TITEL;
			if (Awi_alert(2, A_ASKDEL) == 1)	/* sollen wir? */
			{
				if (from == wi)			/* haben wir selbst die Auswahl? */
				{
					last = TRUE;
					if (appl_find("KOBOLD_2") > 0)	/* Kobold ran... */
					{
						last = FALSE;	/* internes Error-Flag */
						if (ACSblk->multitask)
							p = (char *)Mxalloc((ACSblk->Aselect.actlen + 2) * (LINE_LEN + 10), 0x42);
						else
							p = (char *)Malloc((ACSblk->Aselect.actlen + 2) * (LINE_LEN + 10));
						if (!p)
							last = TRUE;
						else
						{
							Adr_start();
							obnr = Adr_next();
							aob = (AOBJECT *) wi->work + obnr + 1;
							if (aob->type == AT_FILE)
							{
								strcpy(winp, "#2=1\r\n");	/* Dialoglevel runter */
								strcpy(p, winp);
								strcpy(winp, "#0 ");
								strcpy(&winp[3], aob->userp1);	/* Laufwerk */
								strcpy(&winp[5], "\r\n");
								strcat(p, winp);
								do
								{
									aob = (AOBJECT *) wi->work + obnr + 1;
									if (aob->type == AT_FILE)
									{
										strcpy(&winp[3], aob->userp1);
										winp[3] = '+';
										winp[4] = ' ';
										i = (int16) strlen(winp);	/* Ende korrigieren */
										if (winp[i - 1] == '\\')
											winp[i - 1] = EOS;
										strcat(winp, "\r\n");
										strcat(p, winp);
									}
								}
								while ((obnr = Adr_next()) >= 0);
								sprintf(winp, "#14\n");
								strcat(p, winp);
								buff[0] = KOBOLD_JOB_NO_WINDOW;
								buff[1] = ACSblk->gl_apid;
								buff[2] = 0;
								{
								char **pp = (char **)&buff[3];
								*pp = p;
								}
								Awi_update(RESET_UPDATE);
								appl_write(appl_find("KOBOLD_2"), 16, buff);
								do
								{
									evnt_mesag(buff);
									if (buff[0] != KOBOLD_ANSWER)
										appl_write(ACSblk->gl_apid, 16, buff);
								} while (buff[0] != KOBOLD_ANSWER);
								Mfree(p);
								if (buff[3] != KOB_FINISHED)	/* KOBOLD ist noch aktiv */
								{
									buff[0] = KOBOLD_CLOSE;	/* Message: Beenden */
									buff[1] = ACSblk->gl_apid;
									buff[2] = 0;
									appl_write(appl_find("KOBOLD_2"), 16, buff);
									do
									{
										evnt_mesag(buff);
										if (buff[0] != KOBOLD_ANSWER)
											appl_write(ACSblk->gl_apid, 16, buff);
									} while (buff[0] != KOBOLD_ANSWER);
									if (buff[3] > 0)	/* Fehler */
										last = TRUE;
								}
								Awi_update(RESTART_UPDATE);
							}
						}

					}
					if (last)			/* Fehler im Kobold, dann selber */
					{
						ob = Aob_create(&D_ACTION.root);
						Aob_fix(ob);
						Aob_puttext(ob, DA_TEXT, "");
						form_center(ob, &ob->ob_x, &ob->ob_y, &ob->ob_width, &ob->ob_height);
						Amo_hide();
						Awi_update(BEG_UPDATE);
						form_dial(FMD_START, ob->ob_x, ob->ob_y, ob->ob_width, ob->ob_height, ob->ob_x, ob->ob_y,
								  ob->ob_width, ob->ob_height);
						objc_draw(ob, 0, MAX_DEPTH, ob->ob_x, ob->ob_y, ob->ob_width, ob->ob_height);
						Amo_show();
						Adr_start();
						while ((obnr = Adr_next()) >= 0)
						{
							aob = (AOBJECT *) wi->work + obnr + 1;
							if (aob->type == AT_FILE)
							{
								strcpy(src, aob->userp1);
								if (delete(src))
									break;
								Adr_del(wi, obnr);
							}
						}
						form_dial(FMD_FINISH, ob->ob_x, ob->ob_y, ob->ob_width, ob->ob_height, ob->ob_x, ob->ob_y,
								  ob->ob_width, ob->ob_height);
						Awi_update(END_UPDATE);
						Aob_delete(ob);
					}
					Adr_unselect();
					make_work(wi);
				}
			}
			ACSblk->alert_name = NULL;
		}
		break;

	case AS_DRAGGED:
		if (ACSblk->Aselect.actlen)
		{
			from = ACSblk->ev_window;
			ACSblk->ev_window = wi;
			drag_drive();
			ACSblk->ev_window = from;
		}
		break;

	case AS_REDRAWFILE:
		if (ACSblk->Aselect.actlen)		/* steht was drin? */
		{
			from = ACSblk->Aselect.window;
			if (from == wi)				/* haben wir selbst die Auswahl? */
				Adr_unselect();			/* dann weg */
		}
		if (in_out && *(char *) in_out)	/* wurde ein Pfad übergeben? */
		{
			strcpy(path, (char *) in_out);
			p = strrchr(path, '\\');
			if (p && p[1])
				*p = EOS;
			user = wi->user;
			strcpy(src, "A:");
			*src += user->act_drive;
			strcpy(src + 2, user->path);
			if (!strcmp(src, path))
				break;					/* kein Redraw nötig */
		}
		i = wi->wi_slider.y;
		make_work(wi);
		(wi->vslid) (wi, i);
		break;

	case AS_SELECTFILE:
		if (!in_out)					/* eigene Auswahl deselektieren */
		{
			if (ACSblk->Aselect.actlen > 0 && ACSblk->Aselect.window == wi)
				Adr_unselect();
		} else
		{
			user = wi->user;
			strcpy(src, (char *) in_out);
			if (strlen(src) > 3)
			{
				i = (int16) strlen(src) - 1;
				if (src[i] == '\\')
				{
					src[i] = EOS;
					last = TRUE;
				} else
					last = FALSE;
				strcpy(own, wi->name);
				/* gewünschter Pfad!... */
				strcpy(path, Af_2path(str, src));
				i = (int16) strlen(path) - 1;
				if (i > 0)
					path[i] = EOS;
				strcpy(winp, src);
				p = strrchr(winp, '\\');
				*p = EOS;
				p++;
				if (strcmp(winp, own))	/* anderer Ordner */
				{
					user->act_drive = winp[0] - 'A';
					Dsetdrv(user->act_drive);
					Dsetpath(path);
					make_work(wi);
				}
				if (last)
					strcat(src, "\\");
				last = wi->work[0].ob_tail;
				for (i = 2; i <= last; i += 2)
				{
					aob = (AOBJECT *) wi->work + i + 1;
					if (aob->type != AT_FILE)
						continue;
					if (strlen(aob->userp1) <= 3)
						continue;
					if (!strcmp(aob->userp1, src))
						Adr_add(wi, i);
				}
			}
		}
		break;

	case AS_ASKFILE:
		if (in_out)
			*(Awindow **) in_out = wi;
		break;

	default:
		return Awi_service(wi, task, in_out);
	}
	return TRUE;
}

static void setwininf(Awindow * wi, char *text)
{
	if (wi->info)
		Ast_delete(wi->info);
	wi->info = Ast_create(text);
	if (wi->wi_id > 0)
		wind_set(wi->wi_id, WF_INFO, wi->info);
}

static long tos_version(void)
{
	long sav;
	SYSHDR *sys_header;

	sav = Super((void *) 1L);
	if (sav == 0L)
		sav = Super(0L);
	sys_header = *((SYSHDR **) 0x04F2L);
	if (sav != -1L)
		Super((void *) sav);

	return (sys_header->os_version);
}

static void trim_dest(char *src, char *dest)
{
	char *s;

	if (NULL != (s = strrchr(src, DIR)))
	{
		if (s[1] == EOS)
			*s = EOS;
		s = strrchr(src, DIR);
		strcat(src, "\\");
		if (s[1] != EOS)
			strcat(dest, s + 1);
	}
}

int16 ACSinit(void)
{
	back = D_ICONS.root;				/* back.ob_width = WIDTH; back.ob_height = HEIGHT; */
	back0 = D_ICONS._00aD_ICONS;
	dirs = D_ICONS._02_D_ICONS;			/* dirs.ob_width = WIDTH; dirs.ob_height = HEIGHT; */
	dirs0 = D_ICONS._02aD_ICONS;
	files = D_ICONS._04_D_ICONS;		/* files.ob_width = WIDTH; files.ob_height = HEIGHT; */
	files0 = D_ICONS._04aD_ICONS;

	F_DIR.create(NULL);

	return OK;
}
