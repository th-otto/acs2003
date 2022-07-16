#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include "acs.h"
#include "acs230.h"
#include "acsplus.h"
#include "../src/country.h"

#ifndef LINE_LEN
#define LINE_LEN	(256)
#define PATH_LEN	(256)
#endif

#define LIMIT_MODUL	(50)				/* maximale Module */
#define DIA_MODUL		(16)			/* sichtbare Module */
#define EW_MODUL		(20)

#define AC_HELP     (1025)				/* fÅr PureC-Hilfe */

#define CEWS_DIRTY	(0x1)

#define EP_NAME		(0)
#define EP_COMP		(1)
#define EP_LINK		(2)
#define EP_ASSI		(3)
#define EP_DEST 	(4)
#define EP_LIB		(5)
#define EP_INC		(6)
#define EP_DEBUG	(7)

typedef struct
{
	char id[6];							/* "CEWS2" */
	char path[8][PATH_LEN];				/* 0=EWS-Name, 1=Compiler, 2=Linker, 3=Assembler, 4=PRG-name */
	/* 5=LIB-Pfad, 6=INCLUDE-Pfad, 7=DEBUG-Pfad */
	char modul[LIMIT_MODUL][PATH_LEN];
	int16 modactiv[LIMIT_MODUL];		/* Modul aktiv */
	char acc_name[9];
	long cv;
	char cp[4][LINE_LEN];
	long av;
	char ap[LINE_LEN];
	long lv;
	char lp[2][LINE_LEN];
	int16 lines;
	int16 flag;
	Awindow *w_base;
} EWS_PARA;

#include	"cews.h"

#include	"cews.ah"


#ifndef __ACS_MODULE__

#if COUNTRY == COUNTRY_DE

Adescr ACSdescr = {
	"ACS3.00",
	300,
	-80, -80,
	AB_CLICKMENU | AB_FEEDBACK | AB_ACUSTIC | AB_CENTERDIALOG | AB_GDOSFONT | AB_SMARTREDRAW | AB_LAZYEVAL | AB_NOMEMCHECK,
	"  ACSpro 3.0.0",
	&PUR_DESK,
	NULL,
	{
		{ ARROW, NULL },
		{ BUSYBEE, NULL },
		{ POINT_HAND, NULL },
		{ FLAT_HAND, NULL },
		{ TEXT_CRSR, NULL },
		{ THIN_CROSS, NULL },
		{ THICK_CROSS, NULL },
		{ OUTLN_CROSS, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL }
	},
	{
		"[3][ Es ist ein allgemeiner | Fehler aufgetreten! ][ Abbruch ]",
		"[1][ Ein Fehler ist aufgetreten! | %s][ Abbruch ]",
		"[1][ Die Anzahl der momentan| darstellbaren Farben oder| die aktuelle Bildauflîsung | ist nicht korrekt!][ Abbruch ]",
		"[1][ Eine Datei lieû sich | nicht erzeugen!][ Abbruch ]",
		"[3][ Die Datei '%s'| lÑût sich nicht erzeugen! ][ Abbruch ]",
		"[1][ Auf fremden Speicher | wurde zugegriffen!][ Abbruch ]",
		"[2][ | Soll das Accessory | >>               << | gestartet werden?| ][Ja|  Nein  ]",
		"[2][ Unbekannte GEM-Nachricht | erhalten.| ID = '%s'| Weiterhin berichten?][Ja|  Nein  ]",
		"[3][ Keine freie GEM-Fenster-ID | mehr vorhanden!| Abhilfe: Ein offenes| GEM-Fenster schlieûen.][    OK    ]",
		"[3][ Kein freier ACS-Fenster- | Platz mehr vorhanden!| Abhilfe: Ein ACS-Fenster| lîschen.][    OK    ]",
		"[1][ Es ist ein Fehler bei der | Ein-/Ausgabe aufgetreten!][ Abbruch ]",
		"[1][ Es ist ein Fehler in| der Speicherverwaltung | aufgetreten!][ Abbruch ]",
		"[1][ Das Modul konnte nicht | geladen werden!][ Abbruch ]",
		"[1][ Das Modul '%s' | konnte nicht geladen werden! ][ Abbruch ]",
		"[1][ Beim Laden des Moduls | (mit Pexec-3) ist ein| Fehler aufgetreten!][ Abbruch ]",
		"[1][ Beim Laden des Moduls | '%s' ist ein | Fehler aufgetreten!][ Abbruch ]",
		"[1][ Der dem Modul folgende| Restspeicher kann nicht | freigegeben werden!][ Abbruch ]",
		"[1][ Der dem Modul '%s' | folgenden Restspeicher kann | nicht freigegeben werden!][ Abbruch ]",
		"[1][ Die Adresse eines Speicher- | blocks ist ungerade!][ Abbruch ]",
		"[1][ Eine Datei lieû sich| nicht korrekt îffnen! ][ Abbruch ]",
		"[1][ Die Datei '%s' | lÑût sich nicht îffnen!][ Abbruch ]",
		"[1][ Es steht nicht genÅgend | Speicher zur VerfÅgung!][ Abbruch ]",
		"[1][ Ein Fehler trat auf einem| Ein-/Ausgabekanal auf!][ Abbruch ]",
		"[1][ Ein Speicherblock| befindet sich auûerhalb | der legalen Bereiche!][ Abbruch ]",
		"[1][ Beim Lesen aus einer Datei| ist ein Fehler aufgetreten! ][ Abbruch ]",
		"[1][ Beim Lesen aus der Datei | '%s' ist ein | Fehler aufgetreten!][ Abbruch ]",
		"[1][ Das Modul hat leider eine | falsche Versionsnummer!][ Abbruch ]",
		"[1][Das Modul|'%s'|hat eine falsche|Versionsnummer!][ Abbruch ]",
		"[1][ Beim Schreiben in eine Datei | ist ein Fehler aufgetreten!][ Abbruch ]",
		"[1][ Beim Schreiben in die Datei | '%s' ist ein | Fehler aufgetreten!][ Abbruch ]",
		" Achtung ",
		" Frage ",
		" Stop ",
		" Meldung "
	}
};

#endif


#if COUNTRY == COUNTRY_US

Adescr ACSdescr = {
	"ACS3.00",
	300,
	-80, -80,
	AB_CLICKMENU | AB_FEEDBACK | AB_ACUSTIC | AB_CENTERDIALOG | AB_GDOSFONT | AB_SMARTREDRAW | AB_LAZYEVAL | AB_NOMEMCHECK,
	"  ACSpro 3.0.0",
	&PUR_DESK,
	NULL,
	{
		{ ARROW, NULL },
		{ BUSYBEE, NULL },
		{ POINT_HAND, NULL },
		{ FLAT_HAND, NULL },
		{ TEXT_CRSR, NULL },
		{ THIN_CROSS, NULL },
		{ THICK_CROSS, NULL },
		{ OUTLN_CROSS, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL },
		{ 0, NULL }
	},
	{
		"[3][ Es ist ein allgemeiner | Fehler aufgetreten! ][ Abbruch ]",
		"[1][ Ein Fehler ist aufgetreten! | %s][ Abbruch ]",
		"[1][ Die Anzahl der momentan| darstellbaren Farben oder| die aktuelle Bildauflîsung | ist nicht korrekt!][ Abbruch ]",
		"[1][ Eine Datei lieû sich | nicht erzeugen!][ Abbruch ]",
		"[3][ Die Datei '%s'| lÑût sich nicht erzeugen! ][ Abbruch ]",
		"[1][ Auf fremden Speicher | wurde zugegriffen!][ Abbruch ]",
		"[2][ | Soll das Accessory | >>               << | gestartet werden?| ][Ja|  Nein  ]",
		"[2][ Unbekannte GEM-Nachricht | erhalten.| ID = '%s'| Weiterhin berichten?][Ja|  Nein  ]",
		"[3][ Keine freie GEM-Fenster-ID | mehr vorhanden!| Abhilfe: Ein offenes| GEM-Fenster schlieûen.][    OK    ]",
		"[3][ Kein freier ACS-Fenster- | Platz mehr vorhanden!| Abhilfe: Ein ACS-Fenster| lîschen.][    OK    ]",
		"[1][ Es ist ein Fehler bei der | Ein-/Ausgabe aufgetreten!][ Abbruch ]",
		"[1][ Es ist ein Fehler in| der Speicherverwaltung | aufgetreten!][ Abbruch ]",
		"[1][ Das Modul konnte nicht | geladen werden!][ Abbruch ]",
		"[1][ Das Modul '%s' | konnte nicht geladen werden! ][ Abbruch ]",
		"[1][ Beim Laden des Moduls | (mit Pexec-3) ist ein| Fehler aufgetreten!][ Abbruch ]",
		"[1][ Beim Laden des Moduls | '%s' ist ein | Fehler aufgetreten!][ Abbruch ]",
		"[1][ Der dem Modul folgende| Restspeicher kann nicht | freigegeben werden!][ Abbruch ]",
		"[1][ Der dem Modul '%s' | folgenden Restspeicher kann | nicht freigegeben werden!][ Abbruch ]",
		"[1][ Die Adresse eines Speicher- | blocks ist ungerade!][ Abbruch ]",
		"[1][ Eine Datei lieû sich| nicht korrekt îffnen! ][ Abbruch ]",
		"[1][ Die Datei '%s' | lÑût sich nicht îffnen!][ Abbruch ]",
		"[1][ Es steht nicht genÅgend | Speicher zur VerfÅgung!][ Abbruch ]",
		"[1][ Ein Fehler trat auf einem| Ein-/Ausgabekanal auf!][ Abbruch ]",
		"[1][ Ein Speicherblock| befindet sich auûerhalb | der legalen Bereiche!][ Abbruch ]",
		"[1][ Beim Lesen aus einer Datei| ist ein Fehler aufgetreten! ][ Abbruch ]",
		"[1][ Beim Lesen aus der Datei | '%s' ist ein | Fehler aufgetreten!][ Abbruch ]",
		"[1][ Das Modul hat leider eine | falsche Versionsnummer!][ Abbruch ]",
		"[1][Das Modul|'%s'|hat eine falsche|Versionsnummer!][ Abbruch ]",
		"[1][ Beim Schreiben in eine Datei | ist ein Fehler aufgetreten!][ Abbruch ]",
		"[1][ Beim Schreiben in die Datei | '%s' ist ein | Fehler aufgetreten!][ Abbruch ]",
		" Achtung ",
		" Frage ",
		" Stop ",
		" Meldung "
	}
};

#endif

Aconfig ACSconfig = {
	{ "", "%;", NULL, 0, 0, 4 },
	"PUR_DESK",
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	CFG_INIT_GEMSCRIPT | CFG_INIT_BUBBLEGEM,
	0x5045,
	NULL,
	NULL,
	ACSinit
};

#endif

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

/*	OM: Click: Module laden
 */
static void add_modul(void)
{
	char file[PATH_LEN] = "";
	char name[PATH_LEN] = "";
	char *p;
	EWS_PARA *user;
	int16 slot = 0;
	OBJECT *slider;
	long i;

	user = (EWS_PARA *) ACSblk->ev_window->user;
	strcpy(file, user->path[0]);
	if (NULL != (p = strrchr(file, '\\')))
		p[1] = EOS;
	p = Af_first_fsel(FS_FILESEL, file, "*");
	while (p && Af_2fullname(name, p))
	{
		if (!insert_modul(user, p))
			break;
		p = Af_next_fsel();
	}
	do
		if (!*user->modul[slot++])
			break;
	while (slot <= LIMIT_MODUL) ;

	if (slot == LIMIT_MODUL)
		Awi_alert(1, A_NO_MODUL);

	slider = ACSblk->ev_window->work + LIST_SLIDER;
	i = (long) max(slot - 1, DIA_MODUL);
	Auo_slider(slider, AUO_SLFULL, &i);
	i = (long) max(0, slot - DIA_MODUL - 1);
	Auo_slider(slider, AUO_POS, &i);
	Auo_slider(slider, AUO_UPDATE, NULL);
	Auo_slider(slider, AUO_SLLIVE, NULL);
}

/* -------------------------------------------------------------------------- */

/*	OM:	Click: Assembling
 */
static void assi(void)
{
	int16 dc = ACSblk->ev_window->work[ACSblk->ev_obnr].ob_state & AOS_DCLICK;
	int16 i;
	int16 ob_nr;
	int16 key;
	int16 sel = FALSE;
	COMMAND c;
	EWS_PARA *user;
	char out[PATH_LEN] = "";
	char ext[5];
	Awindow *editor;
	AOBJECT *aob;

	user = (EWS_PARA *) ACSblk->ev_window->user;

	if (!*user->path[EP_ASSI] || Af_length(user->path[EP_ASSI]) <= 0L)
	{
		Awi_alert(1, A_NO_ASSI);
		return;
	}

	if (user->av & 0x1L)
		strcat(out, "-1 ");
	if (user->av & 0x2L)
		strcat(out, "-B ");
	if (user->av & 0x4L)
		strcat(out, "-2 ");
	if (user->av & 0x8L)
		strcat(out, "-C ");
	if (user->av & 0x10L)
		strcat(out, "-3 ");
	if (user->av & 0x20L)
		strcat(out, "-F ");
	if (user->av & 0x40L)
		strcat(out, "-4 ");
	if (user->av & 0x80L)
		strcat(out, "-M ");
	if (user->av & 0x100L)
		strcat(out, "-5 ");
	if (user->av & 0x200L)
		strcat(out, "-A ");
	if (user->av & 0x400L)
		strcat(out, "-8 ");
	if (user->av & 0x800L)
		strcat(out, "-P ");
	if (user->av & 0x1000L)
		strcat(out, "-S ");
	if (user->av & 0x2000L)
		strcat(out, "-U ");
	if (user->av & 0x4000L)
		strcat(out, "-Y ");
	if (user->av & 0x8000L)
		strcat(out, "-V ");
	if (*user->path[EP_INC])
	{
		strcat(out, "-I=");
		strcat(out, user->path[EP_INC]);
		strcat(out, " ");
	}
	if (*user->ap)
	{
		strcat(out, user->ap);
		strcat(out, " ");
	}

	if (ACSblk->Aselect.actlen && ACSblk->Aselect.window == ACSblk->ev_window)
	{
		Adr_start();
		while (0 < (ob_nr = Adr_next()))
		{
			aob = (AOBJECT *) ACSblk->ev_window->work + ob_nr + 1;
			if (aob->ob_flags & AEO && aob->type && AT_FILE)
			{
				sel = TRUE;
				Adr_del(ACSblk->ev_window, ob_nr);
				Af_2ext(ext, aob->userp1);
				if (!strcmp(ext, "S"))
				{
					strcpy(c.command_tail, out);
					strcat(c.command_tail, aob->userp1);
					if (0 != (c.length = (char) strlen(c.command_tail)))
						Ash_prog(user->path[EP_ASSI], (char *) &c, NULL);
					vq_key_s(ACSblk->vdi_handle, &key);
					if (key)
						break;
				}
			}
		}
	}
	if (!sel)
	{
		for (i = 0; i < LIMIT_MODUL; i++)
		{
			if (user->modul[i][0] == EOS)
				break;
			Af_2ext(ext, user->modul[i]);
			if (!strcmp(ext, "S"))
			{
				if (NULL != (editor = user->w_base))
					(editor->service) (editor, AS_SAVEFILE, user->modul[i]);
				if ((dc || newer(user->modul[i], user->path[EP_DEST])) && strlen(out) + strlen(user->modul[i]) <= 125L)
				{
					strcpy(c.command_tail, out);
					strcat(c.command_tail, user->modul[i]);
					if (0 != (c.length = (char) strlen(c.command_tail)))
						Ash_prog(user->path[EP_ASSI], (char *) &c, NULL);
					vq_key_s(ACSblk->vdi_handle, &key);
					if (key)
						break;
				}
			}
		}
	}
}

/* -------------------------------------------------------------------------- */

/*	OM:	Click: Compilieren
 */
static void compile(void)
{
	int16 i;
	int16 ob_nr;
	int16 key;
	int16 asf = FALSE;
	int16 sel = FALSE;
	int16 dc = ACSblk->ev_window->work[ACSblk->ev_obnr].ob_state & AOS_DCLICK;
	long f_id;
	COMMAND c;
	EWS_PARA *user;
	char str[LINE_LEN];
	char path[PATH_LEN] = "";
	char *p;
	char ext[5];
	Awindow *editor;
	AOBJECT *aob;

	user = (EWS_PARA *) ACSblk->ev_window->user;

	if (!*user->path[EP_COMP] || Af_length(user->path[EP_COMP]) <= 0L)
	{
		Awi_alert(1, A_NO_COM);
		return;
	}

	/* PCC.CFG vorbereiten */
	strcpy(path, user->path[EP_COMP]);
	if (NULL == (p = strrchr(path, '\\')))
		return;
	strcpy(p + 1, "PCC.CFG");
	if (Af_length(path) >= 0L)
		if ((int16)Fdelete(path) != 0)
			return;
	if ((f_id = Fcreate(path, 0)) < 0L)
	{
		ACSblk->ACSerror(AE_CREATE_IO, Af_2fullname(str, path));
		return;
	}
	sprintf(str, ";\tEWS-generated compiler-cfg-file\r\n\r\n");
	if (strlen(str) != (Fwrite((int16) f_id, strlen(str), str)))
		goto FIN_COMPILER;
	/* Parameter... */
	*str = EOS;
	if (user->cv & 0x1L)
		strcat(str, "-A\r\n");
	if (user->cv & 0x2L)
		strcat(str, "-J\r\n");
	if (user->cv & 0x4L)
		strcat(str, "-C\r\n");
	if (user->cv & 0x8L)
		strcat(str, "-Z\r\n");
	if (user->cv & 0x10L)
		strcat(str, "-Y\r\n");
	if (user->cv & 0x20L)
		strcat(str, "-M\r\n");
	if (user->cv & 0x40L)
		strcat(str, "-T\r\n");
	if (user->cv & 0x80L)
		strcat(str, "-R\r\n");
	if (user->cv & 0x100L)
		strcat(str, "-B\r\n");
	if (user->cv & 0x200L)
		strcat(str, "-G\r\n");
	if (user->cv & 0x400L)
		strcat(str, "-X\r\n");
	if (user->cv & 0x800L)
		strcat(str, "-P\r\n");
	if (user->cv & 0x1000L)
		strcat(str, "-H\r\n");
	if (user->cv & 0x2000L)
		strcat(str, "-S\r\n");
	if (user->cv & 0x4000L)
		strcat(str, "-Q\r\n");
	if (user->cv & 0x8000L)
		strcat(str, "-V\r\n");
	if (user->cv & 0x10000L)
		strcat(str, "-K\r\n");
	if (strlen(str) != (Fwrite((int16) f_id, strlen(str), str)))
		goto FIN_COMPILER;
	if (*user->cp[1])					/* Errors */
	{
		sprintf(str, "-E%s\r\n", user->cp[1]);
		if (strlen(str) != (Fwrite((int16) f_id, strlen(str), str)))
			goto FIN_COMPILER;
	}
	if (*user->cp[3])					/* Warnings */
	{
		sprintf(str, "-F%s\r\n", user->cp[3]);
		if (strlen(str) != (Fwrite((int16) f_id, strlen(str), str)))
			goto FIN_COMPILER;
	}
	if (*user->cp[2])					/* L√§nge */
	{
		sprintf(str, "-L%s\r\n", user->cp[2]);
		if (strlen(str) != (Fwrite((int16) f_id, strlen(str), str)))
			goto FIN_COMPILER;
	}
	if (*user->path[EP_INC])			/* Include */
	{
		sprintf(str, "-I%s\r\n", user->path[EP_INC]);
		if (strlen(str) != (Fwrite((int16) f_id, strlen(str), str)))
			goto FIN_COMPILER;
	}
	if (*user->cp[0])					/* Rest */
	{
		p = user->cp[0];
		while (*p)
		{
			if (*p == ' ')
				sprintf(str, "\r\n");
			else
				sprintf(str, "%c", *p);
			if (strlen(str) != (Fwrite((int16) f_id, strlen(str), str)))
				goto FIN_COMPILER;
			p++;
		}
	}
	sprintf(str, "\r\n");
	if (strlen(str) != (Fwrite((int16) f_id, strlen(str), str)))
		goto FIN_COMPILER;
	Fclose((int16) f_id);

	if (ACSblk->Aselect.actlen && ACSblk->Aselect.window == ACSblk->ev_window)
	{
		Adr_start();
		while (0 < (ob_nr = Adr_next()))
		{
			aob = (AOBJECT *) ACSblk->ev_window->work + ob_nr + 1;
			if (aob->ob_flags & AEO && aob->type == AT_FILE)
			{
				sel = TRUE;
				Adr_del(ACSblk->ev_window, ob_nr);
				Af_2ext(ext, aob->userp1);
				if (!strcmp(ext, "C"))
				{
					if (!asf)
						save_acs(user, aob->userp1);
					asf = TRUE;
					strcpy(c.command_tail, aob->userp1);
					if (0 != (c.length = (char) strlen(c.command_tail)))
						Ash_prog(user->path[EP_COMP], (char *) &c, NULL);
					vq_key_s(ACSblk->vdi_handle, &key);
					if (key)
						break;
				}
			}
		}
	}
	if (!sel)
	{
		for (i = 0; i < LIMIT_MODUL; i++)
		{
			if (!*user->modul[i])
				break;
			Af_2ext(ext, user->modul[i]);
			if (!strcmp(ext, "C"))
			{
				if (NULL != (editor = user->w_base))
					(editor->service) (editor, AS_SAVEFILE, user->modul[i]);
				if (dc || newer(user->modul[i], user->path[EP_DEST]) || (!asf && save_acs(user, user->modul[i])))
				{
					strcpy(c.command_tail, user->modul[i]);
					if (0 != (c.length = (char) strlen(c.command_tail)))
						Ash_prog(user->path[EP_COMP], (char *) &c, NULL);
					asf = TRUE;
					vq_key_s(ACSblk->vdi_handle, &key);
					if (key)
						break;
				}
			}
		}
	}
	return;

  FIN_COMPILER:
	ACSblk->ACSerror(AE_WRITE_IO, Af_2fullname(str, path));
	Fclose((int16) f_id);
	Fdelete(path);
}

/* -------------------------------------------------------------------------- */

/*	OM:	Click:	Debugger aufrufen
 */
static void debug(void)
{
	EWS_PARA *user;
	COMMAND c;

	user = (EWS_PARA *) ACSblk->ev_window->user;

	if (!*user->path[EP_DEBUG] || Af_length(user->path[EP_DEBUG]) <= 0L ||
		!*user->path[EP_DEST] || Af_length(user->path[EP_DEST]) <= 0L)
	{
		Awi_alert(1, A_NO_DEBUG);
		return;
	}
	strcpy(c.command_tail, user->path[EP_DEST]);
	if (0 != (c.length = (char) strlen(c.command_tail)))
		Ash_prog(user->path[EP_DEBUG], (char *) &c, NULL);
}

/* -------------------------------------------------------------------------- */

/*	OM:	Drag: Edit-Click aufrufen
 */
static void drag_edit(void)
{
	edit();
}

/* -------------------------------------------------------------------------- */

/*	OM: Click:	Source editieren, Selektion beachten
 */
static void edit(void)
{
	int16 obnr;
	AOBJECT *aob;
	EWS_PARA *user;
	char file[PATH_LEN] = "";
	char *p;

	user = ACSblk->ev_window->user;
	if (!ACSblk->Aselect.actlen || ACSblk->Aselect.window != ACSblk->ev_window || ACSblk->ev_mmokstate & K_LSHIFT)
	{
		if (user->w_base)
		{
			strcpy(file, user->path[EP_NAME]);
			if (NULL != (p = strrchr(file, '\\')))
				p[1] = EOS;
			if (NULL != (p = Af_first_fsel(FS_FILESEL, file, "*")))
				do
				{
					(user->w_base->service) (user->w_base, AS_LOADFILE, p);
					p = Af_next_fsel();
				} while (p);
		}
	} else
	{
		Adr_start();
		while (0 < (obnr = Adr_next()))
		{
			aob = (AOBJECT *) ACSblk->ev_window->work + obnr + 1;
			if (aob->ob_flags & AEO && aob && aob->type == AT_FILE && aob->userp1)
			{
				Adr_del(ACSblk->ev_window, obnr);
				open_editor(ACSblk->ev_window, aob->userp1);
			}
		}
	}
}

/* -------------------------------------------------------------------------- */

/*	OM:	Doppelklick auf Modul √∂ffnet dieses
 */
static void file(void)
{
	if (ACSblk->ev_window->work[ACSblk->ev_obnr].ob_state & AOS_DCLICK)
	{
		Adr_add(ACSblk->ev_window, ACSblk->ev_obnr);
		edit();
	}
}

/* -------------------------------------------------------------------------- */

#ifndef __GNUC__ /* unused */
static int16 find_file(char *filename, int16 flag)
{
	char s[LINE_LEN];
	char h[LINE_LEN];
	char old[LINE_LEN];
	char *p;
	DTA dta;
	DTA *olddta;
	int16 state;
	int16 ok = 0;

	olddta = Fgetdta();
	Fsetdta(&dta);
	/* erst Datei... */
	state = Fsfirst(filename, FA_READONLY | FA_SYSTEM | FA_HIDDEN | FA_SYSTEM | FA_ARCHIVE);
	if (!state)
		ok = 1;
	else
	{
		if (flag)						/* dann die Unterverzeichnisse suchen */
		{
			strcpy(old, filename);
			strcpy(s, filename);
			p = strrchr(s, '\\');
			if (p != NULL)
				*(p + 1) = EOS;
			strcpy(h, s);
			strcat(h, "*.*");
			state = Fsfirst(h, FA_SUBDIR);	/* nur dirs */
			while (!state)
			{
				if (strcmp(dta.d_fname, ".") && strcmp(dta.d_fname, "..") && dta.d_attrib & FA_SUBDIR)
				{
					strcpy(h, s);
					strcat(h, dta.d_fname);
					p = strrchr(filename, '\\');
					if (p != NULL)
					{
						strcat(h, p);
						strcpy(filename, h);
						ok = find_file(filename, flag);
						if (ok)
							break;
					}
				}
				state = Fsnext();
			}
		}
	}
	Fsetdta(olddta);
	if (!ok)
		strcpy(filename, old);
	return ok;
}
#endif

/* -------------------------------------------------------------------------- */

#ifndef __GNUC__ /* unused */
/*******************************************/
/* holt Zeile aus Speicher PTR der L√§nge ***/
/* SIZE ab Stelle INDEX R√ºckgabe in STR ****/
/* und TRUE, wenn es Zeile gibt ************/
int16 get_line(char *ptr, char *str, long size, long *index)
{
	char *mem = ptr + *index;
	char *p;
	long len;

	if (*index == size)
		return -1;
	if (mem[0] == '\r')
		mem++;
	p = strchr(mem, '\n');
	if (p)								/* gefunden... */
	{
		len = p - mem;
		if (len > LINE_LEN)
			return -1;
		strncpy(str, mem, len);
		*index = p - ptr + 1;
		if (str[len - 1] == '\r')
		{
			str[len - 1] = EOS;
			return ((int16) len - 1);
		} else
		{
			str[len] = EOS;
			return ((int16) len);
		}
	} else
	{
		len = strlen(mem);
		if (len > LINE_LEN)
			return -1;
		strcpy(str, mem);
		*index = size;
		return ((int16) len);
	}
}
#endif

/* -------------------------------------------------------------------------- */

/*	OM:	holt Dialogeingaben
 */
static void get_tool(Awindow *wi, EWS_PARA *new, int16 dia)
{
	char txt[PATH_LEN];
	char *p;

	switch (dia)
	{
	case 0:							/* CEWS */
		break;
	case 1:							/* Optionen */
		strcpy(txt, new->path[EP_NAME]);
		if (NULL != (p = strrchr(txt, '\\')))
		{
			Aob_gettext(wi->work, OO_NAME, p + 1);
			strcpy(new->path[EP_DEST], txt);
		}
		Aob_gettext(wi->work, OO_ACC, txt);
		if (*txt)
		{
			strcpy(new->acc_name, "        ");
			memcpy(new->acc_name, txt, strlen(strupr(txt)));
		}
/*			Aob_gettext (wi->work, OO_LINES, txt);
			sscanf (txt, "%d", &new->lines);	*/
		break;
	case 2:							/* Compiler */
		new->cv = 0L;
		if (wi->work[OC_ANSI].ob_state & SELECTED)
			new->cv |= 0x1L;
		if (wi->work[OC_NOJUMP].ob_state & SELECTED)
			new->cv |= 0x2L;
		if (wi->work[OC_REM].ob_state & SELECTED)
			new->cv |= 0x4L;
		if (wi->work[OC_REGOPT].ob_state & SELECTED)
			new->cv |= 0x8L;
		if (wi->work[OC_DEBUG].ob_state & SELECTED)
			new->cv |= 0x10L;
		if (wi->work[OC_STRING].ob_state & SELECTED)
			new->cv |= 0x20L;
		if (wi->work[OC_STACKCHECK].ob_state & SELECTED)
			new->cv |= 0x40L;
		if (wi->work[OC_REGISTER].ob_state & SELECTED)
			new->cv |= 0x80L;
		if (wi->work[OC_DR].ob_state & SELECTED)
			new->cv |= 0x100L;
		if (wi->work[OC_SIZE].ob_state & SELECTED)
			new->cv |= 0x200L;
		if (wi->work[OC_UNDER].ob_state & SELECTED)
			new->cv |= 0x400L;
		if (wi->work[OC_ABS].ob_state & SELECTED)
			new->cv |= 0x800L;
		if (wi->work[OC_CDECL].ob_state & SELECTED)
			new->cv |= 0x1000L;
		if (wi->work[OC_STACK].ob_state & SELECTED)
			new->cv |= 0x2000L;
		if (wi->work[OC_PASCAL].ob_state & SELECTED)
			new->cv |= 0x4000L;
		if (wi->work[OC_PROTO].ob_state & SELECTED)
			new->cv |= 0x8000L;
		if (wi->work[OC_CHAR].ob_state & SELECTED)
			new->cv |= 0x10000L;
		Aob_gettext(wi->work, OC_REST, new->cp[0]);
		Aob_gettext(wi->work, OC_ERRORS, new->cp[1]);
		Aob_gettext(wi->work, OC_LEN, new->cp[2]);
		Aob_gettext(wi->work, OC_WARNINGS, new->cp[3]);
		break;
	case 3:							/* Assembler */
		new->av = 0L;
		if (wi->work[OA_MC10].ob_state & SELECTED)
			new->av |= 0x1L;
		if (wi->work[OA_DR].ob_state & SELECTED)
			new->av |= 0x2L;
		if (wi->work[OA_MC20].ob_state & SELECTED)
			new->av |= 0x4L;
		if (wi->work[OA_INC].ob_state & SELECTED)
			new->av |= 0x8L;
		if (wi->work[OA_MC30].ob_state & SELECTED)
			new->av |= 0x10L;
		if (wi->work[OA_IF].ob_state & SELECTED)
			new->av |= 0x20L;
		if (wi->work[OA_MC40].ob_state & SELECTED)
			new->av |= 0x40L;
		if (wi->work[OA_MACRO].ob_state & SELECTED)
			new->av |= 0x80L;
		if (wi->work[OA_MC51].ob_state & SELECTED)
			new->av |= 0x100L;
		if (wi->work[OA_LIST].ob_state & SELECTED)
			new->av |= 0x200L;
		if (wi->work[OA_MC81].ob_state & SELECTED)
			new->av |= 0x400L;
		if (wi->work[OA_LISTING].ob_state & SELECTED)
			new->av |= 0x800L;
		if (wi->work[OA_PRIV].ob_state & SELECTED)
			new->av |= 0x1000L;
		if (wi->work[OA_EXTERN].ob_state & SELECTED)
			new->av |= 0x2000L;
		if (wi->work[OA_DEBUG].ob_state & SELECTED)
			new->av |= 0x4000L;
		if (wi->work[OA_PROTO].ob_state & SELECTED)
			new->av |= 0x8000L;
		Aob_gettext(wi->work, OA_REST, new->ap);
		break;
	case 4:							/* Linker */
		new->lv = 0L;
		if (wi->work[OL_GLOBAL].ob_state & SELECTED)
			new->lv |= 0x1L;
		if (wi->work[OL_FAST].ob_state & SELECTED)
			new->lv |= 0x2L;
		if (wi->work[OL_LOCAL].ob_state & SELECTED)
			new->lv |= 0x4L;
		if (wi->work[OL_LOAD].ob_state & SELECTED)
			new->lv |= 0x8L;
		if (wi->work[OL_DEBUG].ob_state & SELECTED)
			new->lv |= 0x10L;
		if (wi->work[OL_MALLOC].ob_state & SELECTED)
			new->lv |= 0x20L;
		if (wi->work[OL_OBJECT].ob_state & SELECTED)
			new->lv |= 0x40L;
		if (wi->work[OL_PROTO].ob_state & SELECTED)
			new->lv |= 0x80L;
		Aob_gettext(wi->work, OL_REST, new->lp[0]);
		Aob_gettext(wi->work, OL_STACKSIZE, new->lp[1]);
		break;
	}
}

/* -------------------------------------------------------------------------- */

/*	OM:	Click:	HILFE!!!
 */
static void help(void)
{
	int16 msg_buff[8];

	Aob_gettext(ACSblk->ev_window->work, HELP_TEXT, help_str);
	if (*help_str == EOS || help_accid < 0)
		return;

	msg_buff[0] = AC_HELP;
	msg_buff[1] = ACSblk->gl_apid;
	msg_buff[2] = 0;
#ifdef __GNUC__
	{
	char **pp = (char **)&msg_buff[3];
	*pp = help_str;
	}
#else
	*(char **) &msg_buff[3] = help_str;
#endif
	appl_write(help_accid, 16, msg_buff);
	Awi_update(RESET_UPDATE);
	evnt_timer(100, 0);
	Awi_update(RESTART_UPDATE);
}

/* -------------------------------------------------------------------------- */

/*	OM: (ewig?) ACS-Base-Fenster suchen
 */
static int16 init_menu(Awindow *wi)
{
	EWS_PARA *usr;
	Awindow *wb;

	usr = wi->user;
	if (NULL == (wb = usr->w_base))
	{
		wi->state |= AWS_LATEUPDATE;
		wb = wi;
		Awi_sendall(AS_CEWS_BASE, &wb);
		if (wb != wi)
			usr->w_base = wb;
	}
	return OK;
}

/* -------------------------------------------------------------------------- */

/*	OM:	Modul einf√ºgen, keine doppelten
 */
static int16 insert_modul(EWS_PARA *user, char *file)
{
	int16 j;
	char file1[PATH_LEN];
	char file2[PATH_LEN];

	Af_2fullname(file2, file);
	for (j = 0; j < LIMIT_MODUL; ++j)	/* keine Doppelte Datei */
	{
		if (!*user->modul[j])
			break;
		if (!strcmp(user->modul[j], file))
			return FALSE;
		if (!strcmp(Af_2fullname(file1, user->modul[j]), file2))
			return FALSE;
	}
	if (j == LIMIT_MODUL)
		return FALSE;
	user->flag |= CEWS_DIRTY;
	strcpy(user->modul[j], file);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

/*	OM:	als Luxus etwas Tastaturunterst√ºtzung
 */
static int16 key_menu(Awindow *wi, int16 kstate, int16 key)
{
	int16 i;
	int16 ob;
	OBJECT *slider;
	OBJECT *cyc;
	long pos;
	long new_pos;

	cyc = wi->toolbar + OPT_CYCLE;
	Auo_cycle(cyc, AUO_CYCGETINDEX, &i);
	if (i != 0)
		return Awi_keys(wi, kstate, key);
	else
	{
		if (key < 0)
		{
			if (key & NKF_CTRL)
			{
				switch ((char) key)
				{
				case 'a':
					Adr_unselect();
					for (i = 0; i < DIA_MODUL; i++)
						Adr_add(wi, DAT1 + i * (DAT2 - DAT1));
					break;
				case 'b':
					if (ACSblk->Aselect.window == wi)
						Adr_unselect();
					break;
				}
			} else
			{
				switch ((char) key)
				{
				case NK_UP:
					slider = wi->work + LIST_SLIDER;
					Auo_slider(slider, AUO_SLGETPOS, &pos);
					if (ACSblk->Aselect.actlen && ACSblk->Aselect.window == wi)	/* uns geh√∂rt die existierende Auswahl */
					{
						Adr_start();
						ob = Adr_next();
						if (ob == DAT1)	/* oberstes Objekt ist selektiert */
						{
							if (pos)	/* wenn nicht pos=0... */
							{
								Auo_slider(slider, AUO_PREV, NULL);
								Auo_slider(slider, AUO_UPDATE, NULL);
								Auo_slider(slider, AUO_SLLIVE, NULL);
								Adr_add(wi, DAT1);
							}
						} else			/* ...sonst */
						{
							Adr_unselect();
							Adr_add(wi, ob - (DAT2 - DAT1));	/* ...einen h√∂her */
						}
					} else
					{
						Adr_unselect();
						for (i = DIA_MODUL - 1; i >= 0; i--)
							if (wi->work[DAT1 + i * (DAT2 - DAT1)].ob_flags & SELECTABLE)
							{
								Adr_add(wi, DAT1 + i * (DAT2 - DAT1));	/* ich will den letzten! */
								break;
							}
					}
					break;
				case NK_DOWN:
					slider = wi->work + LIST_SLIDER;
					Auo_slider(slider, AUO_SLGETPOS, &pos);
					if (ACSblk->Aselect.actlen && ACSblk->Aselect.window == wi)	/* uns geh√∂rt die existierende Auswahl */
					{
						Adr_start();
						ob = Adr_next();
						if (ob == DAT1 + (DIA_MODUL - 1) * (DAT2 - DAT1))	/* bin unten... */
						{
							Auo_slider(slider, AUO_NEXT, NULL);	/* ...einen weiter... */
							Auo_slider(slider, AUO_SLGETPOS, &new_pos);
							if (pos != new_pos)	/* m√∂glich? */
							{
								Auo_slider(slider, AUO_UPDATE, NULL);
								Auo_slider(slider, AUO_SLLIVE, NULL);
								Adr_add(wi, DAT1 + (DIA_MODUL - 1) * (DAT2 - DAT1));
							}
						} else if (wi->work[ob + (DAT2 - DAT1)].ob_flags & SELECTABLE)
						{
							Adr_unselect();
							Adr_add(wi, ob + (DAT2 - DAT1));	/* ...einen runter */
						}
					} else
					{
						Adr_unselect();
						Adr_add(wi, DAT1);	/* erstbesten */
					}
					break;
				case NK_UNDO:
					if (ACSblk->Aselect.actlen && ACSblk->Aselect.window == wi)
						Adr_unselect();
					break;
				case NK_RET:
				case NK_ENTER:
					if (ACSblk->Aselect.actlen && ACSblk->Aselect.window == wi)
					{
						ACSblk->ev_window = wi;
						edit();
					}
					break;
				default:
					return Awi_keys(wi, kstate, key);
				}
			}
		} else
			return Awi_keys(wi, kstate, key);
	}
	return 0;
}

/* -------------------------------------------------------------------------- */

/*	OM:	Click:	starte was
 */
static void launch(void)
{
	char file[PATH_LEN];
	char *p;
	EWS_PARA *user;

	user = (EWS_PARA *) ACSblk->ev_window->user;

	if (ACSblk->ev_mmokstate & (K_LSHIFT | K_RSHIFT) || !*user->path[EP_DEST] || Af_length(user->path[EP_DEST]) <= 0L)
	{
		strcpy(file, user->path[EP_NAME]);
		if (NULL != (p = strrchr(file, '\\')))
			p[1] = EOS;
		if (Af_select(FS_FILESEL, file, "*"))
			Ash_prog(file, "\0", NULL);
	} else
		Ash_prog(user->path[EP_DEST], "\0", NULL);
}

/* -------------------------------------------------------------------------- */

/*	OM:	linken
 */
static void link(void)
{
	int16 i;
	int16 found = FALSE;
	int16 dc = ACSblk->ev_window->work[ACSblk->ev_obnr].ob_state & AOS_DCLICK;
	long f_id;
	COMMAND c;
	EWS_PARA *user;
	char path[PATH_LEN] = "";
	char str[LINE_LEN];
	char out[PATH_LEN];
	char *p;
	char ext[5];

	user = (EWS_PARA *) ACSblk->ev_window->user;

	if (!*user->path[EP_LINK] || Af_length(user->path[EP_LINK]) < 0L)
	{
		Awi_alert(1, A_NO_LINK);
		return;
	}

	strcpy(path, user->path[EP_LINK]);
	if (NULL != (p = strrchr(path, DIR)))
		Af_2name(p + 1, user->path[EP_NAME]);
	else
		strcat(path, "\\CEWS");
	strcat(path, ".CFG");
	/* Kommandozeile, -C wird gesetzt */
	strcpy(c.command_tail, "-C=");
	strcat(c.command_tail, path);
	c.length = (unsigned char) strlen(c.command_tail);

	/* Datei-Output */
	if (Af_length(path) >= 0L)
		if ((int16)Fdelete(path) != 0)
			return;
	if ((f_id = Fcreate(path, 0)) < 0L)
	{
		ACSblk->ACSerror(AE_CREATE_IO, Af_2fullname(str, path));
		return;
	}
	sprintf(str, ";\tEWS-generated linker-cfg-file\r\n");
	if (strlen(str) != (Fwrite((int16) f_id, strlen(str), str)))
		goto FIN_LINKER;
	sprintf(str, "-O=%s\r\n", user->path[EP_DEST]);
	if (strlen(str) != (Fwrite((int16) f_id, strlen(str), str)))
		goto FIN_LINKER;
	/* Parameter... */
	*str = EOS;
	if (user->lv & 0x1L)
		strcat(str, "-G\r\n");
	if (user->lv & 0x2L)
		strcat(str, "-F\r\n");
	if (user->lv & 0x4L)
		strcat(str, "-L\r\n");
	if (user->lv & 0x8L)
		strcat(str, "-R\r\n");
	if (user->lv & 0x10L)
		strcat(str, "-Y\r\n");
	if (user->lv & 0x20L)
		strcat(str, "-M\r\n");
	if (user->lv & 0x40L)
		strcat(str, "-J\r\n");
	if (user->lv & 0x80L)
		strcat(str, "-V\r\n");
	if (strlen(str) != (Fwrite((int16) f_id, strlen(str), str)))
		goto FIN_LINKER;
	if (*user->lp[1])					/* Stacksize */
	{
		sprintf(str, "-S=%s\r\n", user->lp[1]);
		if (strlen(str) != (Fwrite((int16) f_id, strlen(str), str)))
			goto FIN_LINKER;
	}
	if (*user->lp[0])					/* Rest */
	{
		p = user->lp[0];
		while (*p)
		{
			if (*p == ' ')
				sprintf(str, "\r\n");
			else
				sprintf(str, "%c", *p);
			if (strlen(str) != (Fwrite((int16) f_id, strlen(str), str)))
				goto FIN_LINKER;
			p++;
		}
	}
	sprintf(str, "\r\n");
	if (strlen(str) != (Fwrite((int16) f_id, strlen(str), str)))
		goto FIN_LINKER;

	for (i = 0; i < LIMIT_MODUL; i++)
	{
		if (user->modul[i][0] == EOS)
			break;
		Af_2ext(ext, strcpy(out, user->modul[i]));
		if (!strcmp(ext, "LIB") || !strcmp(ext, "O"))
			sprintf(str, "%s\r\n", out);
		else
		{
			if (!strcmp(ext, "C") || !strcmp(ext, "S"))
			{
				p = strrchr(out, EXT);
				strcpy(p + 1, "O");
				sprintf(str, "%s\r\n", out);
			} else
				continue;
		}
		if (dc || (!found && newer(out, user->path[EP_DEST])))
			found = TRUE;
		if (strlen(str) != (Fwrite((int16) f_id, strlen(str), str)))
			goto FIN_LINKER;
	}
	Fclose((int16) f_id);

	if (found)
		Ash_prog(user->path[EP_LINK], (char *) &c, NULL);
	return;

  FIN_LINKER:
	ACSblk->ACSerror(AE_WRITE_IO, Af_2fullname(str, path));
	Fclose((int16) f_id);
	Fdelete(path);
}

/* -------------------------------------------------------------------------- */

/*	OM:	Live-Routine f√ºr die Modulliste
 */
static char *list_live(void *obj, long pos)
{
	EWS_PARA *user;
	int16 i;
	int16 j;
	int16 p;
	AOBJECT *aob;
	char name[PATH_LEN];
	Awiob wiob;
	Awindow *wctrl;

	Auo_slider(obj, AUO_OWNER, &wiob);
	wctrl = wiob.window;
	user = wctrl->user;
	Adr_unselect();
	for (j = (int16) pos, i = 0; i < DIA_MODUL; ++j, i++)
	{
		aob = (AOBJECT *) wctrl->work + (p = (DAT1 + i * (DAT2 - DAT1))) + 1;
		if (*user->modul[j])
		{
			wctrl->work[p].ob_flags |= (AO_DRAGABLE | SELECTABLE);
			Aob_puttext(wctrl->work, p, Af_2fullname(name, user->modul[j]));
			aob->type = AT_FILE;
			aob->userp1 = user->modul[j];
		} else
		{
			wctrl->work[p].ob_flags &= ~(AO_DRAGABLE | SELECTABLE);
			Aob_puttext(wctrl->work, p, "");
			aob->type = 0;
		}
		(wctrl->obchange) (wctrl, p, -1);
	}
	return "";
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

/*	OM: Create:	Hauptfenster
 */
static Awindow *make_menu(void *para)
{
	Awindow *wi;
	EWS_PARA *user;
	char titel[LINE_LEN];
	char file[PATH_LEN] = "";
	char *p;
	long f_id;
	int16 state;
	DTA *olddta;
	DTA dta;

	olddta = Fgetdta();
	Fsetdta(&dta);
	strcpy(file, ACSblk->cfg_path);
	strcat(file, "CEWS.INF");
	vq_key_s(ACSblk->vdi_handle, &state);
	if (!(state & (K_LSHIFT | K_RSHIFT)) && Af_length(file) > 0L)
	{
		if (0L < (f_id = Fopen(file, FO_READ)))
		{
			*file = EOS;
			p = file;
			do
			{
				if (1L != Fread((int16) f_id, 1L, p))
					break;
				p++;
			} while (p[-1] != '\r' && p[-1] != '\n');
			p[-1] = EOS;
			Fclose((int16) f_id);
		}
		if (Af_length(file) < 0L)
			*file = EOS;
	}
	if (!*file && ACSblk->application && !Af_select(FS_FILESEL, file, "EWS"))
		return NULL;
	if (!*Af_2fullname(titel, file))
		return NULL;

	wi = Awi_create((Awindow *) & F_CEWS);
	user = Ax_malloc(sizeof(EWS_PARA));
	if ((wi == NULL) || (user == NULL))
		return NULL;
	memset(user, 0, sizeof(EWS_PARA));

	if (NULL != (p = strrchr(file, '.')))
		*p = EOS;
	strcat(file, ".EWS");
	strcpy(user->path[EP_NAME], file);
	wi->user = user;
	if (Af_length(file) > 0L)
	{
		f_id = Fopen(file, FO_READ);
		if (f_id > 0L)
		{
			if (sizeof(EWS_PARA) != (Fread((int16) f_id, sizeof(EWS_PARA), user)) || strncmp(user->id, "CEWS2", 5))
				memset(user, 0, sizeof(EWS_PARA));
			Fclose((int16) f_id);
		}
	}
	Fsetdta(olddta);
	strcpy(user->id, "CEWS2");
	memset(user->modactiv, 0, LIMIT_MODUL * sizeof(int16));
	user->w_base = ACSblk->ev_window;	/* Base finden */
	Awi_sendall(AS_CEWS_BASE, &user->w_base);
	if (user->w_base == ACSblk->ev_window)
		user->w_base = NULL;
	strcpy(user->path[EP_NAME], file);
	put_tool(wi, user, 0);
	user->flag &= ~CEWS_DIRTY;
	Af_2fullname(titel, file);
	Ast_delete(wi->name);
	wi->name = Ast_create(titel);
	user->w_base = wi;
	Awi_sendall(AS_CEWS_BASE, &user->w_base);
	if (user->w_base == wi)
		user->w_base = NULL;			/* Fehler */
	if (ACSblk->application)
		(wi->open) (wi);

	return wi;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

/*	OM:	Ist 'mod' neuer als 'prg'
 */
static int16 newer(char *mod, char *prg)
{
	DTA *olddta;
	DTA mod_dta;
	DTA prg_dta;
	int16 result = TRUE;
	int16 m[6];
	int16 p[6];

	if (Af_length(mod) < 0L)
		return FALSE;
	if (Af_length(prg) < 0L)
		return TRUE;
	olddta = Fgetdta();
	Fsetdta(&mod_dta);
	if (!Fsfirst(mod, 0x27))
	{
		Fsetdta(&prg_dta);
		if (!Fsfirst(prg, 0x27))
		{
			m[0] = mod_dta.d_date & 0x1F;	/* Tag */
			m[1] = (mod_dta.d_date >> 5) & 0xF;	/* Monat */
			m[2] = (mod_dta.d_date >> 9) & 0x7F;	/* Jahr */
			m[3] = (mod_dta.d_time >> 11) & 0x1F;	/* Std */
			m[4] = (mod_dta.d_time >> 5) & 0x3F;	/* Min */
			m[5] = mod_dta.d_time & 0x1F;	/* Sec */

			p[0] = prg_dta.d_date & 0x1F;	/* Tag */
			p[1] = (prg_dta.d_date >> 5) & 0xF;	/* Monat */
			p[2] = (prg_dta.d_date >> 9) & 0x7F;	/* Jahr */
			p[3] = (prg_dta.d_time >> 11) & 0x1F;	/* Std */
			p[4] = (prg_dta.d_time >> 5) & 0x3F;	/* Min */
			p[5] = prg_dta.d_time & 0x1F;	/* Sec */

			if (m[2] < p[2])			/*  Jahr */
				result = FALSE;
			if (m[2] == p[2])
			{
				if (m[1] < p[1])		/* Monat */
					result = FALSE;
				if (m[1] == p[1])
				{
					if (m[0] < p[0])	/* Tag */
						result = FALSE;
					if (m[0] == p[0])
					{
						if (m[3] < p[3])	/* Std */
							result = FALSE;
						if (m[3] == p[3])
						{
							if (m[4] < p[4])	/* Min */
								result = FALSE;
							if (m[4] == p[4])
							{
								if (m[5] <= p[5])	/* Sek */
									result = FALSE;
							}
						}
					}
				}
			}
		}
	}
	Fsetdta(olddta);
	return result;
}

/* -------------------------------------------------------------------------- */

/*	OM:	Click:	Autostart einer EWS-Datei einrichten
 */
static void o_launch(void)
{
	char file[PATH_LEN];
	char inf[PATH_LEN];
	char *p;
	long f_id;
	EWS_PARA *user;

	user = ACSblk->ev_window->user;
	strcpy(inf, user->path[EP_NAME]);
	if (NULL != (p = strrchr(inf, DIR)))
		p[1] = EOS;
	if (Af_select(FS_EWSSEL, inf, "EWS") && *inf && Af_length(inf) > 0L)
	{
		strcat(inf, "\r");
		strcpy(file, ACSblk->cfg_path);
		strcat(file, "CEWS.INF");
		if (Af_length(file) >= 0L)
			if ((int16)Fdelete(file) != 0)
				return;
		if (0 < (f_id = Fcreate(file, 0)))
		{
			Fwrite((int16) f_id, strlen(inf), inf);
			Fclose((int16) f_id);
			alert_str(A_EWS_OK, Af_2name(file, inf));
		} else
			ACSblk->ACSerror(AE_CREATE_IO, Af_2fullname(file, inf));
	}
}

/* -------------------------------------------------------------------------- */

/*	OM:	Click:	neue EWS-Datei laden
 */
static void o_load(void)
{
	EWS_PARA *user;
	char file[PATH_LEN];
	char titel[LINE_LEN];
	char *p;
	char ext[5];
	long f_id;
	int16 i;

	user = ACSblk->ev_window->user;
	if (*ews_file)
		strcpy(file, ews_file);
	else
	{
		if (user->flag & CEWS_DIRTY && 2 == Awi_alert(2, A_ASK_LOAD))
			return;
		if (user->w_base)
			for (i = 0; i < LIMIT_MODUL; ++i)	/* terminiere nicht-ACS-Kinder */
				if (*user->modul[i] && Af_2ext(ext, user->modul[i]) && strcmp(ext, "ACS"))
					(user->w_base->service) (user->w_base, AS_SAVEFILE, user->modul[i]);

		strcpy(file, user->path[EP_NAME]);
		if (NULL != (p = strrchr(file, DIR)))
			p[1] = EOS;
		if (!Af_select(FS_EWSSEL, file, "EWS"))
			return;
	}
	(ACSblk->ev_window->closed) (ACSblk->ev_window);

	strcpy(user->path[EP_NAME], file);
	if (Af_length(file) > 0L)
	{
		f_id = Fopen(file, FO_READ);
		if (f_id > 0L)
		{
			if (sizeof(EWS_PARA) != (Fread((int16) f_id, sizeof(EWS_PARA), user)) || strncmp(user->id, "CEWS2", 5))
				memset(user, 0, sizeof(EWS_PARA));
			Fclose((int16) f_id);
		}
	} else
		memset(user, 0, sizeof(EWS_PARA));
	strcpy(user->id, "CEWS2");
	memset(user->modactiv, 0, LIMIT_MODUL * sizeof(int16));
	user->w_base = ACSblk->ev_window;	/* Base finden */
	Awi_sendall(AS_CEWS_BASE, &user->w_base);
	if (user->w_base == ACSblk->ev_window)
		user->w_base = NULL;
	strcpy(user->path[EP_NAME], file);
	Af_2fullname(titel, file);
	Ast_delete(ACSblk->ev_window->name);
	ACSblk->ev_window->name = Ast_create(titel);
	if (!*ews_file)
	{
		put_tool(ACSblk->ev_window, user, 1);
		(ACSblk->ev_window->open) (ACSblk->ev_window);
	}
}

/* -------------------------------------------------------------------------- */

/*	OM:	Click: EWS-Datei sichern
 */
static void o_save(void)
{
	long f_id;
	char file[PATH_LEN];
	OBJECT *cyc;
	EWS_PARA *new;
	int16 pos;

	new = ACSblk->ev_window->user;
	cyc = ACSblk->ev_window->toolbar + OPT_CYCLE;
	Auo_cycle(cyc, AUO_CYCGETINDEX, &pos);
	get_tool(ACSblk->ev_window, new, pos);
	new->flag = 0;

	if (Af_length(new->path[EP_NAME]) >= 0L)
		if ((int16)Fdelete(new->path[EP_NAME]) != 0)
			return;
	f_id = Fcreate(new->path[EP_NAME], 0);
	if (f_id > 0L)
	{
		Fwrite((int16) f_id, sizeof(EWS_PARA), new);
		Fclose((int16) f_id);
	} else
		ACSblk->ACSerror(AE_CREATE_IO, Af_2fullname(file, new->path[EP_NAME]));
}

/* -------------------------------------------------------------------------- */

/*	OM:	ACS einen Editor aufrufen lassen
 */
static void open_editor(Awindow *wi, char *file)
{
	EWS_PARA *user;
	int16 i;
	char ext[5];

	user = wi->user;
	for (i = 0; i < LIMIT_MODUL; i++)
		if (!strcmp(user->modul[i], file))
			break;
	if (user->w_base && ((i < LIMIT_MODUL && !user->modactiv[i]) || i == LIMIT_MODUL))
		if ((user->w_base->service) (user->w_base, AS_LOADFILE, file) &&
			strcmp(Af_2ext(ext, file), "ACS") && i < LIMIT_MODUL)
			user->modactiv[i] = TRUE;
}

/* -------------------------------------------------------------------------- */

/*	OM:	Clicks:	Pfade holen
 */
static void prg_sel(void)
{
	char file[PATH_LEN] = "";
	char *p;
#ifdef __GNUC__
	char *title = 0;
#else
	char *title;
#endif
	EWS_PARA *new;
	OBJECT *cyc;
	int16 pos;

	new = ACSblk->ev_window->user;
	cyc = ACSblk->ev_window->toolbar + OPT_CYCLE;
	Auo_cycle(cyc, AUO_CYCGETINDEX, &pos);
	switch (pos)
	{
	case 0:
		break;
	case 1:							/* CEWS */
		switch (ACSblk->ev_obnr)
		{
		case OO_INC:
			strcpy(file, new->path[EP_INC]);
			if (NULL != (p = strrchr(file, '\\')))
				p[1] = EOS;
			title = FS_PATHSEL;
			break;
		case OO_LIB:
			strcpy(file, new->path[EP_LIB]);
			if (NULL != (p = strrchr(file, '\\')))
				p[1] = EOS;
			title = FS_PATHSEL;
			break;
		case OO_DEBUG:
			strcpy(file, new->path[EP_DEBUG]);
			title = FS_PRGSEL;
			break;
		}
		break;
	case 2:							/* Compiler */
		if (ACSblk->ev_obnr == OC_COMPILER)
		{
			strcpy(file, new->path[EP_COMP]);
			title = FS_PRGSEL;
		}
		break;
	case 3:							/* Assembler */
		if (ACSblk->ev_obnr == OA_ASSM)
		{
			strcpy(file, new->path[EP_ASSI]);
			title = FS_PRGSEL;
		}
		break;
	case 4:							/* Linker */
		if (ACSblk->ev_obnr == OL_LINKER)
		{
			strcpy(file, new->path[EP_LINK]);
			title = FS_PRGSEL;
		}
		break;
	}
	if (Af_select(title, file, "*"))
	{
		switch (pos)
		{
		case 0:
			break;
		case 1:						/* CEWS */
			switch (ACSblk->ev_obnr)
			{
			case OO_INC:
				if (NULL != (p = strrchr(file, DIR)))
					p[1] = EOS;
				if (Af_length(file) == -1L)
					strcpy(new->path[EP_INC], file);
				else
					strcpy(new->path[EP_INC], "");
				break;
			case OO_LIB:
				if (NULL != (p = strrchr(file, DIR)))
					p[1] = EOS;
				if (Af_length(file) == -1L)
					strcpy(new->path[EP_LIB], file);
				else
					strcpy(new->path[EP_LIB], "");
				break;
			case OO_DEBUG:
				if (Af_length(file) > 0L)
					strcpy(new->path[EP_DEBUG], file);
				else
					strcpy(new->path[EP_DEBUG], "");
			}
			break;
		case 2:						/* Compiler */
			if (Af_length(file) > 0L)
				strcpy(new->path[EP_COMP], file);
			else
				strcpy(new->path[EP_COMP], "");
			break;
		case 3:						/* Assembler */
			if (Af_length(file) > 0L)
				strcpy(new->path[EP_ASSI], file);
			else
				strcpy(new->path[EP_ASSI], "");
			break;
		case 4:						/* Linker */
			if (Af_length(file) > 0L)
				strcpy(new->path[EP_LINK], file);
			else
				strcpy(new->path[EP_LINK], "");
			break;
		}
		new->flag |= CEWS_DIRTY;
		Aob_puttext(ACSblk->ev_window->work, ACSblk->ev_obnr, file);
		(ACSblk->ev_window->obchange) (ACSblk->ev_window, ACSblk->ev_obnr, -1);
	}
}

/* -------------------------------------------------------------------------- */

/*	OM:	Click:	Projekt halt
 */
static void projectile(void)
{
	int16 key;

	if (ACSblk->Aselect.window == ACSblk->ev_window)
		Adr_unselect();
	compile();
	vq_key_s(ACSblk->vdi_handle, &key);
	if (!key)
	{
		Aev_mess();
		assi();
		vq_key_s(ACSblk->vdi_handle, &key);
		if (!key)
		{
			Aev_mess();
			link();
		}
	}
}

/* -------------------------------------------------------------------------- */

/*	OM:	Werte schreiben
 */
static void put_tool(Awindow *wi, EWS_PARA *new, int16 dia)
{
	Awiob wiob;
	OBJECT *slider;
	AOBJECT *aob;
	long j;
	int16 i;
	void *live[2];
	char name[PATH_LEN];

	switch (dia)
	{
	case 0:							/* CEWS */
		wiob.window = wi;
		live[0] = list_live;
		live[1] = slider = wiob.entry = wi->work + LIST_SLIDER;
		wiob.obnr = LIST_SLIDER;
		Auo_slider(slider, AUO_SELF, &wiob);
		Auo_slider(slider, AUO_SLCALL, &live);
		i = 0;
		Auo_slider(slider, AUO_SETVAL, "");
		Auo_slider(slider, AUO_SLLEN, &i);
		j = (long) DIA_MODUL;
		Auo_slider(slider, AUO_SLSIZE, &j);
		for (i = 0; i < DIA_MODUL; i++)
		{
			aob = (AOBJECT *) wi->work + (DAT1 + i * (DAT2 - DAT1)) + 1;
			if (*new->modul[i])
			{
				wi->work[(DAT1 + i * (DAT2 - DAT1))].ob_flags |= (AO_DRAGABLE | SELECTABLE);
				Aob_puttext(wi->work, (DAT1 + i * (DAT2 - DAT1)), Af_2fullname(name, new->modul[i]));
				aob->type = AT_FILE;
				aob->userp1 = new->modul[i];
			} else
			{
				wi->work[(DAT1 + i * (DAT2 - DAT1))].ob_flags &= ~(AO_DRAGABLE | SELECTABLE);
				Aob_puttext(wi->work, (DAT1 + i * (DAT2 - DAT1)), "");
				aob->type = 0;
				aob->userp1 = NULL;
			}
		}
		for (j = 0L; j < LIMIT_MODUL; ++j)
			if (!*new->modul[j])
				break;
		j = max(j, (long) DIA_MODUL);
		Auo_slider(slider, AUO_SLFULL, &j);
		j = 0L;
		Auo_slider(slider, AUO_POS, &j);
		Auo_slider(slider, AUO_FULLUPDATE, NULL);

		if (*new->acc_name)
			help_accid = appl_find(new->acc_name);
		if (!*new->acc_name || help_accid < 0)
		{
			wi->work[HELP_BUT].ob_state |= DISABLED;
			wi->work[HELP_BUT].ob_flags &= ~(SELECTABLE | EXIT | DEFAULT);
			wi->work[HELP_BACK].ob_state |= DISABLED;
			wi->work[HELP_BACK].ob_flags &= ~(SELECTABLE | EXIT | DEFAULT);
		}
		Aob_puttext(wi->work, HELP_TEXT, "");
		wi->ob_edit = Aob_findflag(wi->work, 0, EDITABLE);
		wi->ob_col = -1;
		break;
	case 1:							/* Optionen */
		Aob_puttext(wi->work, OO_INC, new->path[EP_INC]);
		Aob_puttext(wi->work, OO_LIB, new->path[EP_LIB]);
		Aob_puttext(wi->work, OO_DEBUG, new->path[EP_DEBUG]);
		Aob_puttext(wi->work, OO_NAME, Af_2fullname(name, new->path[EP_DEST]));
		Aob_puttext(wi->work, OO_ACC, new->acc_name);
		break;
	case 2:							/* Compiler */
		if (new->cv & 0x1L)
			wi->work[OC_ANSI].ob_state |= SELECTED;
		if (new->cv & 0x2L)
			wi->work[OC_NOJUMP].ob_state |= SELECTED;
		if (new->cv & 0x4L)
			wi->work[OC_REM].ob_state |= SELECTED;
		if (new->cv & 0x8L)
			wi->work[OC_REGOPT].ob_state |= SELECTED;
		if (new->cv & 0x10L)
			wi->work[OC_DEBUG].ob_state |= SELECTED;
		if (new->cv & 0x20L)
			wi->work[OC_STRING].ob_state |= SELECTED;
		if (new->cv & 0x40L)
			wi->work[OC_STACKCHECK].ob_state |= SELECTED;
		if (new->cv & 0x80L)
			wi->work[OC_REGISTER].ob_state |= SELECTED;
		if (new->cv & 0x100L)
			wi->work[OC_DR].ob_state |= SELECTED;
		if (new->cv & 0x200L)
			wi->work[OC_SIZE].ob_state |= SELECTED;
		if (new->cv & 0x400L)
			wi->work[OC_UNDER].ob_state |= SELECTED;
		if (new->cv & 0x800L)
			wi->work[OC_ABS].ob_state |= SELECTED;
		if (new->cv & 0x1000L)
			wi->work[OC_CDECL].ob_state |= SELECTED;
		if (new->cv & 0x2000L)
			wi->work[OC_STACK].ob_state |= SELECTED;
		if (new->cv & 0x4000L)
			wi->work[OC_PASCAL].ob_state |= SELECTED;
		if (new->cv & 0x8000L)
			wi->work[OC_PROTO].ob_state |= SELECTED;
		if (new->cv & 0x10000L)
			wi->work[OC_CHAR].ob_state |= SELECTED;
		Aob_puttext(wi->work, OC_COMPILER, new->path[EP_COMP]);
		Aob_puttext(wi->work, OC_REST, new->cp[0]);
		Aob_puttext(wi->work, OC_ERRORS, new->cp[1]);
		Aob_puttext(wi->work, OC_LEN, new->cp[2]);
		Aob_puttext(wi->work, OC_WARNINGS, new->cp[3]);
		break;
	case 3:							/* Assembler */
		if (new->av & 0x1L)
			wi->work[OA_MC10].ob_state |= SELECTED;
		if (new->av & 0x2L)
			wi->work[OA_DR].ob_state |= SELECTED;
		if (new->av & 0x4L)
			wi->work[OA_MC20].ob_state |= SELECTED;
		if (new->av & 0x8L)
			wi->work[OA_INC].ob_state |= SELECTED;
		if (new->av & 0x10L)
			wi->work[OA_MC30].ob_state |= SELECTED;
		if (new->av & 0x20L)
			wi->work[OA_IF].ob_state |= SELECTED;
		if (new->av & 0x40L)
			wi->work[OA_MC40].ob_state |= SELECTED;
		if (new->av & 0x80L)
			wi->work[OA_MACRO].ob_state |= SELECTED;
		if (new->av & 0x100L)
			wi->work[OA_MC51].ob_state |= SELECTED;
		if (new->av & 0x200L)
			wi->work[OA_LIST].ob_state |= SELECTED;
		if (new->av & 0x400L)
			wi->work[OA_MC81].ob_state |= SELECTED;
		if (new->av & 0x800L)
			wi->work[OA_LISTING].ob_state |= SELECTED;
		if (new->av & 0x1000L)
			wi->work[OA_PRIV].ob_state |= SELECTED;
		if (new->av & 0x2000L)
			wi->work[OA_EXTERN].ob_state |= SELECTED;
		if (new->av & 0x4000L)
			wi->work[OA_DEBUG].ob_state |= SELECTED;
		if (new->av & 0x8000L)
			wi->work[OA_PROTO].ob_state |= SELECTED;
		Aob_puttext(wi->work, OA_ASSM, new->path[EP_ASSI]);
		Aob_puttext(wi->work, OA_REST, new->ap);
		break;
	case 4:							/* Linker */
		if (new->lv & 0x1L)
			wi->work[OL_GLOBAL].ob_state |= SELECTED;
		if (new->lv & 0x2L)
			wi->work[OL_FAST].ob_state |= SELECTED;
		if (new->lv & 0x4L)
			wi->work[OL_LOCAL].ob_state |= SELECTED;
		if (new->lv & 0x8L)
			wi->work[OL_LOAD].ob_state |= SELECTED;
		if (new->lv & 0x10L)
			wi->work[OL_DEBUG].ob_state |= SELECTED;
		if (new->lv & 0x20L)
			wi->work[OL_MALLOC].ob_state |= SELECTED;
		if (new->lv & 0x40L)
			wi->work[OL_OBJECT].ob_state |= SELECTED;
		if (new->lv & 0x80L)
			wi->work[OL_PROTO].ob_state |= SELECTED;
		Aob_puttext(wi->work, OL_LINKER, new->path[EP_LINK]);
		Aob_puttext(wi->work, OL_REST, new->lp[0]);
		Aob_puttext(wi->work, OL_STACKSIZE, new->lp[1]);
		break;
	}
}

/* -------------------------------------------------------------------------- */

/*	OM:	ACS die Dateien sichern lassen
 */
static int16 save_acs(EWS_PARA *user, char *file)
{
	int16 i;
	int16 flag = FALSE;
	char name1[PATH_LEN];
	char name2[PATH_LEN];
	char ext[5];

	if (!user->w_base)
		return FALSE;
	Af_2name(name1, file);
	for (i = 0; i < LIMIT_MODUL; i++)	/* gibt es gleichnamigen ACS-Typ? */
	{
		Af_2name(name2, user->modul[i]);
		if (!strcmp(name1, name2) && Af_2ext(ext, user->modul[i]) && !strcmp(ext, "ACS"))
		{
			(user->w_base->service) (user->w_base, AS_SAVEFILE, user->modul[i]);
			flag = TRUE;
		}
	}
	if (!flag)							/* nichts gefunden, also alle ACS sichern */
	{
		for (i = 0; i < LIMIT_MODUL; i++)
		{
			Af_2ext(ext, user->modul[i]);
			if (!strcmp(ext, "ACS"))
				(user->w_base->service) (user->w_base, AS_SAVEFILE, user->modul[i]);
		}
	} else
		return TRUE;
	return FALSE;
}

/* -------------------------------------------------------------------------- */

/*	OM:	Click: globale Suche mit Text√∂ffnen
 */
static void search(void)
{
	char search[16];

	Aob_gettext(ACSblk->ev_window->work, HELP_TEXT, search);
	if (!*search)
		return;
	Awi_sendall(AS_LOOKSTRING, search);
}

/* -------------------------------------------------------------------------- */

/*	OM:	Service
 */
#define BLOCK_LENGTH		(16384L)

static int16 service_menu(Awindow *wi, int16 task, void *in_out)
{
	EWS_PARA *user;
	int16 j;
	int16 f;
	int16 i = -1;
	DTA *olddta;
	DTA newdta;
	OBJECT *slider;
	OBJECT *cyc;
	Awindow *window;
	Awindow *editor = NULL;
	long f_id;
	long pos;
	long count = 0;
	long sum_len;
	long act_len;
	char file[PATH_LEN];
	char *txt;

	user = wi->user;
	switch (task)
	{
	case AS_TERM:
		if (!ACSblk->appexit && user->w_base)
		{
			for (i = 0; i < LIMIT_MODUL; ++i)	/* terminiere Kinder */
				if (*user->modul[i])
					(user->w_base->service) (user->w_base, AS_EDSAVEIT, user->modul[i]);
		}
		if (user->flag & CEWS_DIRTY && 1 == Awi_alert(2, A_ASK_SAVE))
		{
			if (Af_length(user->path[EP_NAME]) >= 0L)
				if ((int16)Fdelete(user->path[EP_NAME]) != 0)
				{
					Awi_delete(wi);
#ifdef __ACS_MODULE__
					ACSmoduleterm();
#endif
					break;
				}
			f_id = Fcreate(user->path[EP_NAME], 0);
			if (f_id > 0L)
			{
				Fwrite((int16) f_id, sizeof(EWS_PARA), user);
				Fclose((int16) f_id);
			} else
				ACSblk->ACSerror(AE_CREATE_IO, Af_2fullname(file, user->path[EP_NAME]));
		}
		Awi_delete(wi);
#ifdef __ACS_MODULE__
		ACSmoduleterm();
#endif
		break;

	case AS_EDTERM:					/* ACS meldet uns Ende eines EDITORs */
		for (i = 0; i < LIMIT_MODUL; ++i)
			if (!strcmp(user->modul[i], in_out))
			{
				user->modactiv[i] = FALSE;
				break;
			}
		break;

	case AS_DELETE:					/* Modul l√∂schen */
		if (!ACSblk->Aselect.actlen || ACSblk->Aselect.window != wi)
			break;
		slider = wi->work + LIST_SLIDER;
		Auo_slider(slider, AUO_SLGETPOS, &pos);
		Adr_start();
		while (0 < (i = Adr_next()))
		{
			j = (i - DAT1) / 2 + (int16) pos;
			if (user->modactiv[j] && (NULL != (window = user->w_base)))
				(window->service) (window, AS_EDSAVEIT, user->modul[j]);
			*user->modul[j] = EOS;		/* intelligente L√ºcken.. */
			Adr_del(wi, i);
		}
		j = 0;
		while (j < LIMIT_MODUL - 1)		/* ...die es zu schlie√üen gilt */
		{
			if (*user->modul[j])
				j++;
			else
			{
				i = j;
				while (!*user->modul[i] && i < LIMIT_MODUL)
					++i;
				if (i == LIMIT_MODUL)
					j = LIMIT_MODUL;
				else
				{
					for (f = j; i < LIMIT_MODUL; ++i)
						strcpy(user->modul[f++], user->modul[i]);
					for (; f < LIMIT_MODUL; f++)
						*user->modul[f] = EOS;
				}
			}
		}
		for (count = 0L; count < LIMIT_MODUL; ++count)
			if (!*user->modul[count])
				break;
		count = max(count, DIA_MODUL);
		Auo_slider(slider, AUO_SLFULL, &count);
		Auo_slider(slider, AUO_UPDATE, NULL);
		Auo_slider(slider, AUO_SLLIVE, NULL);
		user->flag |= CEWS_DIRTY;
		break;

	case AS_LOOKSTRING:
		if (NULL == (txt = Ax_malloc(BLOCK_LENGTH)))
			break;
		memset(txt, 0, BLOCK_LENGTH);
		olddta = Fgetdta();
		Fsetdta(&newdta);
		while (++i < LIMIT_MODUL && *user->modul[i])
		{
			if (0L > (f_id = Fopen(user->modul[i], FO_READ)))
				continue;
			if (!strcmp(Af_2ext(file, user->modul[i]), "ACS"))
				continue;
			sum_len = Fseek(0, (int16) f_id, 2);
			if (sum_len > strlen((char *) in_out))
			{
				Fseek(0, (int16) f_id, 0);
				do
				{
					if (sum_len > BLOCK_LENGTH)
						act_len = BLOCK_LENGTH;
					else
						act_len = sum_len;
					if (act_len != Fread((int16) f_id, act_len, txt))
						break;
					if (act_len < BLOCK_LENGTH)
						memset(txt + act_len, 0, BLOCK_LENGTH - act_len);
					if (NULL != (strstr(txt, (char *) in_out)) && !user->modactiv[i])
					{
						open_editor(wi, user->modul[i]);
						if (user->modactiv[i] && user->w_base)
						{
							editor = user->w_base;
							(editor->service) (editor, AS_LOOKSTRING, in_out);
						}
						break;
					}
					Fseek(-strlen((char *) in_out), (int16) f_id, 1);
					sum_len -= BLOCK_LENGTH - strlen((char *) in_out);
				} while (sum_len > 0L);
			}
			Fclose((int16) f_id);
		}
		Fsetdta(olddta);
		Ax_free(txt);
		break;

	case AS_LOADFILE:
		cyc = wi->toolbar + OPT_CYCLE;	/* besondere Vorkehrungen f√ºr Click-Routine */
		Auo_cycle(cyc, AUO_CYCGETINDEX, &j);
		if (j || wi->state & AWS_ICONIZED)
			break;
		strcpy(ews_file, in_out);
		if (!strcmp(user->path[EP_NAME], ews_file))
		{
			*ews_file = EOS;
			break;
		}
		ACSblk->ev_window = wi;
		ACSblk->ev_object = wi->work;
		ACSblk->ev_obnr = DO_LOAD;
		o_load();
		*ews_file = EOS;
		put_tool(wi, user, 0);
		wi->state |= AWS_FORCEREDRAW;
		Awi_show(wi);
		break;

	case AS_INFO:
		if (NULL != (window = F_INFO.create(&F_INFO)))
		{
			Awi_dialog(window);
			Awi_delete(window);
		}
		break;

	case AS_ASKHELP:
		if (in_out)
			*(Awindow **) in_out = wi;
		break;

	case AS_HELP:
		cyc = wi->toolbar + OPT_CYCLE;
		Auo_cycle(cyc, AUO_CYCGETINDEX, &j);
		if (j || wi->state & AWS_ICONIZED)
			break;
		Aob_puttext(wi->work, HELP_TEXT, (char *) in_out + 1);
		(wi->obchange) (wi, HELP_TEXT, -1);
		ACSblk->ev_window = wi;
		help();
		break;

	default:
		return Awi_service(wi, task, in_out);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

/*	OM: Umsortieren per Drag-Routine
 */
static void sort_file(void)
{
	EWS_PARA *user;
	OBJECT *slider;
	AOBJECT *aob;
	int16 obnr;
	int16 j;
	int16 beg;
	int16 end;
	char p_save[PATH_LEN];
	long pos;

	if (!ACSblk->Aselect.actlen)
		return;
	user = ACSblk->ev_window->user;
	slider = ACSblk->ev_window->work + LIST_SLIDER;
	if (ACSblk->Aselect.window == ACSblk->ev_window)	/* eigenes */
	{
		Adr_start();
		obnr = Adr_next();
		aob = (AOBJECT *) ACSblk->ev_window->work + obnr + 1;
		if (!aob->userp1 || !*(char *) aob->userp1)
			return;
		for (end = 0; end < LIMIT_MODUL; ++end)
			if (!strcmp(user->modul[end], aob->userp1))
				break;
		if (end == LIMIT_MODUL)
			return;
		strcpy(p_save, user->modul[end]);
		Auo_slider(slider, AUO_SLGETPOS, &pos);
		beg = (ACSblk->ev_obnr - DAT1) / 2 + (int16) pos;
		if (beg == end || !*user->modul[beg])
			return;
		if (beg < end)
		{
			for (j = end; j > beg; --j)
				strcpy(user->modul[j], user->modul[j - 1]);
			strcpy(user->modul[beg], p_save);
		} else
		{
			for (j = end; j < beg; ++j)
				strcpy(user->modul[j], user->modul[j + 1]);
			strcpy(user->modul[beg], p_save);
		}
		user->flag |= CEWS_DIRTY;
		Adr_unselect();
		Auo_slider(slider, AUO_SLLIVE, NULL);
	} else
	{
		Adr_start();
		while (0 <= (obnr = Adr_next()))
		{
			if (NULL != (aob = (AOBJECT *) ACSblk->Aselect.window->work + obnr + 1))
				switch (aob->type)
				{
				case AT_FILE:
					if (aob->userp1 && insert_modul(user, aob->userp1))
						Adr_del(ACSblk->Aselect.window, obnr);
					break;
				case AT_ICONWINDOW:
					if (aob->userp1 && user->w_base &&
						((Awindow *) aob->userp1)->info && insert_modul(user, ((Awindow *) aob->userp1)->info + 1))
					{
						Adr_del(ACSblk->Aselect.window, obnr);
						Auo_slider(slider, AUO_SLLIVE, NULL);
					}
				}
		}
	}
}

/* -------------------------------------------------------------------------- */

/*	OM:	schaltet per POPUP zwischen den Dialogen hin und her
 */
static void t_cycle(void)
{
	EWS_PARA *new;
	OBJECT *old;
#ifdef __GNUC__
	OBJECT *work = 0;
#else
	OBJECT *work;
#endif
	OBJECT *cyc;
	int16 pos;
	int16 zap;
	Axywh box;

	new = ACSblk->ev_window->user;
	cyc = ACSblk->ev_window->toolbar + OPT_CYCLE;
	Auo_cycle(cyc, AUO_CYCGETINDEX, &pos);
	get_tool(ACSblk->ev_window, new, pos);
	Aus_cycle();
	Auo_cycle(cyc, AUO_CYCGETINDEX, &zap);	/* neue Seite */
	if (zap != pos)
	{
		Awi_diaend();
		if (ACSblk->Aselect.window == ACSblk->ev_window)
			Adr_unselect();
		old = ACSblk->ev_window->work;	/* Alten WORK-Bereich merken... */
		switch (zap)					/* ...neuen anlegen... */
		{
		case 0:						/* CEWS */
			work = Aob_create(&D_CEWS.root);
			break;
		case 1:						/* Optionen */
			work = Aob_create(&D_OPTION.root);
			break;
		case 2:						/* Compiler */
			work = Aob_create(&D_COMPILER.root);
			break;
		case 3:						/* Assembler */
			work = Aob_create(&D_ASSM.root);
			break;
		case 4:						/* Linker */
			work = Aob_create(&D_LINKER.root);
			break;
		}
		if (work)
		{
			Aob_fix(work);				/* ...bei Erfolg fixen... */
			ACSblk->ev_window->work = work;	/* ...einklinken und Cursor setzen... */
			Awi_uoself(ACSblk->ev_window);
			ACSblk->ev_window->ob_edit = Aob_findflag(work, 0, EDITABLE);
			ACSblk->ev_window->ob_col = -1;
			Aob_delete(old);			/* ...alten weg... */
			/* ...neue Ausma√üe... */
			wind_calc(WC_BORDER, ACSblk->ev_window->wi_kind,
					  ACSblk->ev_window->toolbar[0].ob_x,
					  ACSblk->ev_window->work[0].ob_x + ACSblk->ev_window->toolbar[0].ob_y,
					  ACSblk->ev_window->work[0].ob_width,
					  ACSblk->ev_window->toolbar[0].ob_height + ACSblk->ev_window->work[0].ob_height, &box.x, &box.y,
					  &box.w, &box.h);
			ACSblk->ev_window->wi_act.w = box.w;
			ACSblk->ev_window->wi_act.h = box.h;
			new->flag |= CEWS_DIRTY;
			put_tool(ACSblk->ev_window, new, zap);	/* ...Werte rein und zeichnen */
			ACSblk->ev_window->state |= AWS_FORCEREDRAW;
			(ACSblk->ev_window->sized) (ACSblk->ev_window, &ACSblk->ev_window->wi_act);
			if (!zap)
				Awi_diastart();
		}
	}
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

/*****************************************************************/
/* INIT-Routine **************************************************/
int16 ACSinit(void)
{
	Awindow *win;
	Awindow *wcon;

	if (NULL != (wcon = F_CEWS.create(NULL)))
	{
		win = wcon;
		Awi_sendall(AS_CEWS_BASE, &win);
		if (win != wcon)
		{
			((EWS_PARA *) wcon->user)->w_base = win;
			(wcon->open) (wcon);
		} else
		{
			wcon->state |= AWS_LATEUPDATE;
			((EWS_PARA *) wcon->user)->w_base = NULL;
		}
	}
	return OK;
}
