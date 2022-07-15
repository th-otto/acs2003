#include <string.h>
#include <stdio.h>
#include "acs.h"
#include "acs230.h"
#include "acsplus.h"
#include "../src/country.h"

#ifndef UNUSED
# define UNUSED(x) ((void)(x))
#endif

#if COUNTRY == COUNTRY_DE
static char ALERT_MSG[] = "[2][ Wollen Sie den Proze\236 | '%s' wirklich | beenden? ][ OK | Abbruch ]";
static char TEXT_01[] = "";
static char TEXT_02[] = " PROZESSE ";
#else
static char ALERT_MSG[] = "[2][ Do you real want to kill | process '%s' ? ][ OK | Cancel ]";
static char TEXT_01[] = "";
static char TEXT_02[] = " PROCESSES ";
#endif




static boolean pman_service(Awindow *self, int16 task, void *in_out);
static Awindow *pman_create(void *para);
static int16 pman_init(Awindow *self);
static int16 pman_keys(Awindow *self, int16 kstate, int16 key);
static void pman_vslid(Awindow *self, int16 pos);
static void pman_sized(Awindow *self, Axywh *area);

static long get_hz200(void);

static AUSERBLK230 euser = { A_editor, 0L, Auo_editor, NULL, NULL, NULL };
static AUSERBLK230 vslider = { A_wislider, 3L, Auo_wislider, NULL, NULL, NULL };


static struct {
	OBJECT root;
	AOBJECT _a_root;
	OBJECT vslider;
} pman_work = {
	{ -1,  2,  2, G_USERDEF, 0x0040, 0x0000, C_UNION(&euser), 0x0000, 0x0000, 0x000e, 0x0008 },
	{ Aus_editor, 0L, AEO, 0x0000, NULL, NULL, 0, 0 },
	{  0, -1, -1, G_USERDEF, 0x0060, 0x0000, C_UNION(&vslider), 0x000d, 0x0000, 1, 8 }
};

#define EDITOR    0
#define VERSLIDER 2


static Awindow23x pman_win = {
	NULL,
	pman_service,
	pman_create,
	Awi_open,
	pman_init,
	&pman_work.root,
	NULL,
	0, 0,
	-1,
	0x41ef,
	{ 0, 0, 120, 50 },
	{ 0, 0, 0, 0 },
	{ 0, 0, 0, 0 },
	{ -1, -1, -1, -1 },
	0, 0,
	0xf8f8,
	TEXT_02,
	TEXT_01,
	10000,
	AW_TOOLBOX | AW_ICON | AW_GHOSTICON,
	0,
	-1,
	NULL,
	NULL,
	pman_keys,
	Awi_obchange,
	Awi_redraw,
	Awi_topped,
	Awi_closed,
	Awi_fulled,
	Awi_arrowed,
	Awi_hslid,
	pman_vslid,
	pman_sized,
	Awi_moved,
};

static long timer1;
static long timer2;

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static int16 pman_init(Awindow *self)
{
	DTA *olddta;
	DTA dta;
	OBJECT *editor;
	char path[128];
	long sel[4] = { 0, 0, -1, -1 };
	char *dot;
	long count;
	
	self->state |= AWS_LATEUPDATE;
	timer2 = Supexec(get_hz200);
	if (timer2 - timer1 >= 200)
	{
		timer1 = timer2;
		editor = &self->work[EDITOR];
		olddta = Fgetdta();
		Fsetdta(&dta);
		if (Fsfirst("u:\\proc\\*.*", 0) == 0)
		{
			Auo_editor(editor, AUO_EDGETSELECT, &sel);
			Auo_editor(editor, AUO_EDDELETE, NULL);
			Auo_editor(editor, AUO_EDUPDATE, NULL);
			dot = strrchr(strcpy(path, dta.d_fname), '.');
			if (dot != NULL)
				*dot = '\0';
			Auo_editor(editor, AUO_EDAPPLINE, path);
			count = 1;
			while (Fsnext() == 0)
			{
				Auo_editor(editor, AUO_EDNEWLINE, NULL);
				dot = strrchr(strcpy(path, dta.d_fname), '.');
				if (dot != NULL)
					*dot = '\0';
				Auo_editor(editor, AUO_EDAPPLINE, path);
				count++;
			}
			if (sel[0] >= 0)
			{
				if (sel[0] > count)
					sel[0] = count;
				Auo_editor(editor, AUO_EDSETSELECT, &sel);
			}
			Auo_editor(editor, AUO_FULLUPDATE, NULL);
		}
		Fsetdta(olddta);
	}
	return OK;
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

static int16 pman_keys(Awindow *self, int16 kstate, int16 key)
{
	char filename[128]; /* 80 */
	DTA dta;
	DTA *olddta;
	long sel[4] = { 0, 0, -1, -1 };
	long rows;
	EDITGETS gets;
	OBJECT *editor;
	
	editor = &self->work[EDITOR];
	Auo_editor(editor, AUO_EDGETSELECT, &sel);
	if (key < 0) /* key & NKF_FUNC */
	{
		switch ((char) key)
		{
		case NK_DEL:
			if (sel[0] >= 0)
			{
				gets.row = sel[0];
				Auo_editor(editor, AUO_EDGETROW, &gets);
				((char *)(gets.text))[gets.size] = '\0';
				sprintf(filename, "u:\\proc\\%s.*", gets.text);
				olddta = Fgetdta();
				Fsetdta(&dta);
				if (Fsfirst(filename, 0) == 0)
				{
					Fsetdta(olddta);
					sprintf(filename, ALERT_MSG, gets.text);
					if (Awi_alert(1, filename) == 1)
					{
						Auo_editor(editor, AUO_EDUNSELECT, NULL);
						sprintf(filename, "u:\\proc\\%s", dta.d_fname);
						Fdelete(filename);
					}
				} else
				{
					Fsetdta(olddta);
				}
			}
			break;
		
		case NK_UP:
			if (sel[0] <= 0)
			{
				Auo_editor(editor, AUO_EDGETROWS, &rows);
				sel[0] = sel[2] = rows - 1;
				sel[1] = 0;
				sel[3] = 127;
			} else
			{
				sel[0]--;
				sel[2]--;
			}
			Auo_editor(editor, AUO_EDSETSELECT, &sel);
			break;
		
		case NK_DOWN:
			Auo_editor(editor, AUO_EDGETROWS, &rows);
			if (sel[0] < 0 || sel[0] == rows - 1)
			{
				sel[0] = sel[2] = sel[1] = 0;
				sel[3] = 127;
			} else
			{
				sel[0]++;
				sel[2]++;
			}
			Auo_editor(editor, AUO_EDSETSELECT, &sel);
			break;
		}
	}
	return -1;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

static Awindow *pman_create(void *para)
{
	Awindow *self;
	Awiob wiob;
	long val;
	OBJECT *editor;
	
	UNUSED(para);
	self = Awi_create((Awindow *)&pman_win);
	if (self == NULL)
		return NULL;
	timer1 = timer2 = Supexec(get_hz200);
	wiob.window = self;
	editor = &self->work[EDITOR];
	wiob.entry = editor;
	wiob.obnr = EDITOR;
	Auo_editor(editor, AUO_SELF, &wiob);
	Auo_editor(editor, AUO_ED01SELECT, NULL);
	val = 999999L;
	Auo_editor(editor, AUO_EDWRAP, &val);
	val = 128;
	Auo_editor(editor, AUO_EDCFULL, &val);
	Auo_editor(editor, AUO_BEGIN, NULL);
	Auo_editor(editor, AUO_EDSLIDERS, NULL);
	wiob.entry = &self->work[VERSLIDER];
	wiob.obnr = VERSLIDER;
	Auo_editor(editor, AUO_EDVERSLIDER, &wiob);
	return self;
}

/* -------------------------------------------------------------------------- */

static boolean pman_service(Awindow *self, int16 task, void *in_out)
{
	switch (task)
	{
	case AS_TERM:
		Awi_delete(self);
		ACSmoduleterm();
		return TRUE;
	}
	return Awi_service(self, task, in_out);
}

/* -------------------------------------------------------------------------- */

static void pman_sized(Awindow *self, Axywh *area)
{
	OBJECT *editor;
	int16 x, y;
	
	editor = &self->work[EDITOR];
	wind_calc(WC_WORK, self->wi_kind, 0, 0, area->w, area->h, &x, &y, &editor->ob_width, &editor->ob_height);
	area->x = ((area->x + 4) & -8) - x;
	Auo_editor(editor, AUO_EDRESIZE, NULL);
	Auo_editor(editor, AUO_EDSLIDERS, NULL);
	Awi_sized(self, area);
}

/* -------------------------------------------------------------------------- */

static void pman_vslid(Awindow *self, int16 pos)
{
	OBJECT *slider;
	AUSERBLK *auser;
	
	slider = &self->work[VERSLIDER];
	auser = slider->ob_spec.auserblk;
	auser->ub_serv(slider, AUO_SLWIPOS, &pos);
	auser->ub_serv(slider, AUO_UPDATE, NULL);
	auser->ub_serv(slider, AUO_SLLIVE, NULL);
}

/* -------------------------------------------------------------------------- */

static long get_hz200(void)
{
	return *((long *)0x4ba);
}

/* -------------------------------------------------------------------------- */

int16 ACSinit(void)
{
	if (pman_win.create(NULL) == NULL)
		ACSmoduleterm();
	return OK;
}
