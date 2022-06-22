/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Mouse utilities                                       */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"

static int init = 0;
static Amouse prevmouse = { -1, NULL };
static int16 hide;
static int16 busy;

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 INmouse(void)
{
	if (init++ != 0)
		return OK;
	hide = 0;
	Amo_point();
	return OK;
}

/* -------------------------------------------------------------------------- */

void TRmouse(void)
{
	Amo_point();
}

/* -------------------------------------------------------------------------- */

void Amo_new(Amouse *mouse)
{
	if (prevmouse.number == mouse->number && prevmouse.form == mouse->form)
		return;
	prevmouse.number = mouse->number;
	prevmouse.form = mouse->form;
	if (hide != 0)
		return;
	graf_mouse(mouse->number, mouse->form);
}

/* -------------------------------------------------------------------------- */

void Amo_point(void)
{
	busy = 0;
	while (hide != 0)
		Amo_show();
	Amo_new(&ACSblk->description->mouse[MOUSE_ARROW]);
}

/* -------------------------------------------------------------------------- */

void Amo_busy(void)
{
	Amouse *mouse;
	
	if (busy++ != 0)
		return;
	if (hide != 0)
		return;
	mouse = &ACSblk->description->mouse[MOUSE_BUSYBEE];
	graf_mouse(mouse->number, mouse->form);
}

/* -------------------------------------------------------------------------- */

void Amo_unbusy(void)
{
	if (--busy > 0)
		return;
	busy = 0;
	if (hide != 0)
		return;
	graf_mouse(prevmouse.number, prevmouse.form);
}

/* -------------------------------------------------------------------------- */

void Amo_hide(void)
{
	if (hide++ != 0)
		return;
	graf_mouse(M_OFF, NULL);
}

/* -------------------------------------------------------------------------- */

void Amo_show(void)
{
	if (--hide > 0)
		return;
	hide = 0;
	graf_mouse(M_ON, NULL);
	graf_mouse(prevmouse.number, prevmouse.form);
}

/* -------------------------------------------------------------------------- */

int16 Amo_restart(Amouse *mouse)
{
	int16 prevbusy;
	Amouse *arrow;
	
	prevbusy = busy;
	busy = 0;
	mouse->number = prevmouse.number;
	mouse->form = prevmouse.form;
	arrow = &ACSblk->description->mouse[MOUSE_ARROW];
	graf_mouse(arrow->number, arrow->form);
	return prevbusy;
}

/* -------------------------------------------------------------------------- */

void Amo_return(int16 prevbusy, Amouse *mouse)
{
	busy = prevbusy;
	prevmouse.number = mouse->number;
	prevmouse.form = mouse->form;
	if (hide != 0)
		return;
	if (busy != 0)
		mouse = &ACSblk->description->mouse[MOUSE_BUSYBEE];
	graf_mouse(mouse->number, mouse->form);
}
