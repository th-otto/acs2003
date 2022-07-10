#include	<stdio.h>
#include	<string.h>
#include	<acs.h>

int16 ACSinit(void)
{
	int16 msg[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
	
	ACSblk->description->flags |= AB_NO3D;
	msg[0] = WM_REDRAW;
	msg[1] = ACSblk->gl_apid;
	msg[4] = ACSblk->desk.x;
	msg[5] = ACSblk->desk.y;
	msg[6] = ACSblk->desk.w;
	msg[7] = ACSblk->desk.h;
	appl_write(ACSblk->gl_apid, (int)sizeof(msg), msg);
	form_dial(FMD_FINISH, ACSblk->desk.x, ACSblk->desk.y, ACSblk->desk.w, ACSblk->desk.h,
		ACSblk->desk.x, ACSblk->desk.y, ACSblk->desk.w, ACSblk->desk.h);
	ACSmoduleterm();
	return OK;
}
