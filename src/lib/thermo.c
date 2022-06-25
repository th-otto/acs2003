/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Progress meter                                        */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "country.h"
#include "memory.h"

static void ThermCancel(void);
static boolean ThermoService(Awindow *self, int16 task, void *in_out);
static Awindow *ThermoCreate(void *a);
static int16 ThermoInit(Awindow *self);
static void ThermoClosed(Awindow *self);
static boolean ThermoGEMScript(Awindow *self, int16 anz, char **cmds, A_GSAntwort *antwort);

#include "thermo.ah"
#include "thermo.h"

static OBJECT *ThermObjs[] = {
	&ThermObj.root,  /* THERMO_MINIMAL */
	&ThermTObj.root,  /* THERMO_TEXT */
	&ThermAObj.root,  /* THERMO_NONMODAL */
	&ThermTAObj.root  /* THERMO_PERCENT */
};
static int16 textNr[]  = { NIL, THERMO_TEXT_TEXT, NIL, THERMO_PERCENT_TEXT };
static int16 laufBNr[] = { THERMO_MINIMAL_RUN, THERMO_TEXT_RUN, THERMO_CANCEL_RUN, THERMO_PERCENT_RUN };
static int16 fixBNr[]  = { THERMO_MINIMAL_FIX, THERMO_TEXT_FIX, THERMO_CANCEL_FIX, THERMO_PERCENT_FIX };
static int16 prozNr[]  = { THERMO_MINIMAL_PROC, THERMO_TEXT_PROC, THERMO_CANCEL_PROC, THERMO_PERCENT_PROC };

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 Ash_thermometer(int16 kind, const char *title, int16 color, void *data,
	A_ThermFkt init, A_ThermFkt start, A_ThermFkt cont, A_ThermFkt fkt,
	A_ThermFkt stop, A_ThermFkt quit)
{
	ThermoStruct *user;
	Awindow *win;
	int16 ret;
	
	user = Ax_malloc(sizeof(*user));
	if (user == NULL)
		return FAIL;
	
	memset(user, 0, sizeof(*user));
	user->aktData.data = data;
	user->aktData.init = init;
	user->aktData.start = start;
	user->aktData.cont = cont;
	user->aktData.fkt = fkt;
	user->aktData.stop = stop;
	user->aktData.quit = quit;
	user->thermComp = kind;
	user->title = title;
	user->color = color;
	win = ThermWind.create(user);
	if (win != NULL)
	{
		if (kind & THERMO_NONMODAL)
		{
			win->open(win);
			ret = 2;
		} else
		{
			user->timer = ACSblk->ev_mtcount;
			ACSblk->ev_mtcount = 1;
			ret = Awi_dialog(win);
			win->service(win, AS_TERM, NULL);
			ACSblk->ev_mtcount = user->timer;
			Ax_recycle(user, sizeof(*user));
		}
	} else
	{
#if WITH_FIXES
		ret = 0;
#endif
		if (init)
			init(&user->aktData);
		if (start == NULL || start(&user->aktData))
		{
			if (cont)
			{
				while (cont(&user->aktData))
				{
					if (fkt)
						fkt(&user->aktData);
				}
			}
			if (stop)
				stop(&user->aktData);
		}
		if (quit)
			quit(&user->aktData);
		Ax_recycle(user, sizeof(*user));
	}
	return ret;
}

/* -------------------------------------------------------------------------- */

static void Prozent(Awindow *self, long val)
{
	ThermoStruct *user = self->user;
	OBJECT *lauf;
	OBJECT *fix;
	int16 w;
	boolean changed;
	
	lauf = &self->work[laufBNr[user->thermArt]];
	fix = &self->work[fixBNr[user->thermArt]];
	changed = FALSE;
	w = (uint16)((fix->ob_width * val) >> 12);
	if (lauf->ob_width < w || w == 0)
	{
		lauf->ob_width = w;
		ACSblk->ev_object = self->work;
		ACSblk->ev_obnr = laufBNr[user->thermArt];
		Awi_obchange(self, laufBNr[user->thermArt], -1);
		changed = TRUE;
	}
	if (user->thermComp & THERMO_PERCENT)
	{
		w = (val * 100) >> 12;
		if (changed || w > user->prozent || w == 0)
		{
			if (w > user->prozent || w == 0)
				user->prozent = w;
			Aob_printf(self->work, prozNr[user->thermArt], "%i %%", w);
			ACSblk->ev_object = self->work;
			ACSblk->ev_obnr = prozNr[user->thermArt];
			Awi_obredraw(self, prozNr[user->thermArt]);
		}
	}
}

/* -------------------------------------------------------------------------- */

static void TextUpdate(Awindow *self, const char *text)
{
	ThermoStruct *user = self->user;
	
	if (user->thermComp & THERMO_TEXT)
	{
		Aob_puttext(self->work, textNr[user->thermArt], text);
		ACSblk->ev_object = self->work;
		ACSblk->ev_obnr = textNr[user->thermArt];
		Awi_obredraw(self, textNr[user->thermArt]);
	}
}

/* -------------------------------------------------------------------------- */

static Awindow *ThermoCreate(void *a)
{
	Awindow *self;
	ThermoStruct *user = a;
	int16 dummy;
	
	if (user == NULL)
		return NULL;
	user->thermArt = user->thermComp & 3;
	ThermWind.work = ThermObjs[user->thermArt];
	ThermWind.name = (char *)NO_CONST(user->title);
	self = Awi_create(&ThermWind);
	if (self == NULL)
		return NULL;
	self->wi_work.w = self->work->ob_width;
	self->wi_work.h = self->work->ob_height;
	wind_calc(WC_BORDER, self->wi_kind, self->wi_work.x, self->wi_work.y, self->wi_work.w, self->wi_work.h,
		&dummy, &dummy, &self->wi_act.w, &self->wi_act.h);
	self->user = user;
	user->thermo = self;
	user->aktData.aufruf = -1;
	user->aktData.aktuell = 0;
	user->aktData.maximum = 0;
	self->work[laufBNr[user->thermArt]].ob_width = 0;
	Prozent(self, 0);
	if (user->color >= 0 &&
		ACSblk->ncolors >= 16 &&
		!(ACSblk->description->flags & AB_NO3D))
	{
		AUSERBLK *auser;

		auser = self->work[laufBNr[user->thermArt]].ob_spec.auserblk;
		auser->ub_parm &= ~0x7f;
		auser->ub_parm |= (user->color & 15) | 0x70L;
	}
	
	if (user->aktData.aufruf < 0 &&
		user->aktData.init)
	{
		if (user->aktData.init(&user->aktData) == FALSE)
			self->service(self, AS_TERM, NULL);
	}
	if (user->thermComp & THERMO_TEXT)
	{
		Aob_puttext(self->work, textNr[user->thermArt], user->aktData.text);
	}
	Aob_flags(self, prozNr[user->thermArt], OF_HIDETREE, (user->thermComp & THERMO_PERCENT) == 0);
	self->state |= AWS_LATEUPDATE | AWS_MODIFIED;
	user->running = FALSE;
	return self;
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

static boolean ThermoService(Awindow *self, int16 task, void *in_out)
{
	ThermoStruct *user = self->user;
	
	switch (task)
	{
	case AS_TERM:
		if (!(self->state & AWS_INTERM))
		{
			self->state |= AWS_INTERM;
			self->state &= ~AWS_LATEUPDATE;
			if (user->running && user->aktData.stop)
			{
				if (!(user->thermComp & THERMO_NONMODAL))
					ACSblk->ev_mtcount = user->timer;
				user->aktData.stop(&user->aktData);
				if (!(user->thermComp & THERMO_NONMODAL))
					ACSblk->ev_mtcount = 1;
			}
			Awi_delete(self);
			user->thermo = NULL;
			if (user->aktData.quit)
			{
				if (!(user->thermComp & THERMO_NONMODAL))
					ACSblk->ev_mtcount = user->timer;
				user->aktData.quit(&user->aktData);
				if (!(user->thermComp & THERMO_NONMODAL))
					ACSblk->ev_mtcount = 1;
			}
			if (user->thermComp & THERMO_NONMODAL)
				Ax_recycle(user, sizeof(*user));
		}
		return TRUE;
	}
	
	return FALSE;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

static int16 ThermoInit(Awindow *self)
{
	ThermoStruct *user = self->user;
	long val;
	boolean cont = TRUE;
	
	if (user->running)
	{
		unsigned long aktuell;
		unsigned long frac;
		
		if (!(user->thermComp & THERMO_NONMODAL))
			ACSblk->ev_mtcount = user->timer;
		self->state &= ~AWS_LATEUPDATE;
		cont = user->aktData.cont && user->aktData.cont(&user->aktData);
		TextUpdate(self, user->aktData.text);
		if (cont && user->aktData.fkt)
			user->aktData.fkt(&user->aktData);
		user->aktData.aufruf++;
		if (!(user->thermComp & THERMO_NONMODAL))
			ACSblk->ev_mtcount = 1;
		if (cont && user->aktData.maximum != 0)
		{
			aktuell = user->aktData.aktuell & ~0xfffffL;
			frac = user->aktData.aktuell & 0xfffffL;
			val = ((aktuell / user->aktData.maximum) / 4096) + (frac * 4096) / user->aktData.maximum;
		} else
		{
			val = 4096;
		}
		if (val < 0)
			val = 0;
		else if (val > 4096)
			val = 4096;
		Prozent(self, val);
	}
	
	if (!user->running && self->wi_id >= 0)
	{
		if (user->aktData.start)
		{
			if (!(user->thermComp & THERMO_NONMODAL))
				ACSblk->ev_mtcount = user->timer;
			self->state &= ~AWS_LATEUPDATE;
			cont = user->aktData.start(&user->aktData);
			if (!(user->thermComp & THERMO_NONMODAL))
				ACSblk->ev_mtcount = 1;
		}
		TextUpdate(self, user->aktData.text);
		user->running = cont;
	}
	
	if (!(self->state & AWS_INTERM))
	{
		self->state |= AWS_LATEUPDATE;
		if (!(user->thermComp & THERMO_NONMODAL))
		{
			ACSblk->dia_abort = !cont;
		} else
		{
			if (!cont)
				self->service(self, AS_TERM, NULL);
		}
	}
	
	return OK;
}

/* -------------------------------------------------------------------------- */

static void ThermCancel(void)
{
	Awindow *self = ACSblk->ev_window;
	ThermoStruct *user = self->user;
	
	if (user->aktData.stop)
	{
		if (!(user->thermComp & THERMO_NONMODAL))
			ACSblk->ev_mtcount = user->timer;
		self->state &= ~AWS_LATEUPDATE;
		if (user->aktData.stop(&user->aktData))
		{
			TextUpdate(self, user->aktData.text);
			if (user->thermComp & THERMO_NONMODAL)
				self->service(self, AS_TERM, NULL);
			else
				ACSblk->dia_abort  = TRUE;
			user->running = FALSE;
		} else
		{
			self->state |= AWS_LATEUPDATE;
		}
		if (!(user->thermComp & THERMO_NONMODAL))
			ACSblk->ev_mtcount = user->timer;
	}
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

static void ThermoClosed(Awindow *self)
{
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

static boolean ThermoGEMScript(Awindow *self, int16 anz, char **cmds, A_GSAntwort *antwort)
{
	return TRUE;
}

#ifdef __PUREC__
#pragma warn .par
#endif
