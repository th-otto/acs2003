#include "acs_i.h"
#include "country.h"
#include "about.ah"


void ShowACSVersion(void)
{
	OldAboutMe();
}


void ShowACSUpdate(void)
{
	Awi_doform(&ABOUT_UPDATE_WIND, &ABOUT_UPDATE_WIND);
}


void AboutGUIEditor(void)
{
	Awi_doform(&ABOUT_GUI_EDITOR_WIND, &ABOUT_GUI_EDITOR_WIND);
}
