#include <string.h>
#include "acs.h"
#include "acsplus.h"

#ifndef UNUSED
# define UNUSED(x) ((void)(x))
#endif

static Awindow *proto_win;
static void (*acsmproto)(int16 *ev_mmgpbuf);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static boolean proto_service(Awindow *self, int16 task, void *in_out)
{
	boolean ret;
#ifdef __GNUC__
	boolean (*serv)(Awindow *self, int16 task, void *in_out);
	
	serv = get_protocol()->service;
	if (task == AS_TERM)
	{
		ret = serv(self, AS_TERM, in_out);
		ACSblk->ACSmproto = acsmproto;
		ACSmoduleterm();
		return ret;
	}
	return serv(self, task, in_out);
#else	
	if (task == AS_TERM)
	{
		ret = PROTOCOL.service(self, AS_TERM, self);
		ACSblk->ACSmproto = acsmproto;
		ACSmoduleterm();
		return ret;
	}
	return PROTOCOL.service(self, task, in_out);
#endif
}

/* -------------------------------------------------------------------------- */

static void myproto(int16 *msg)
{
	Awindow *win;
	Axywh area;
	
	win = NULL;
	if (msg[0] >= WM_REDRAW && msg[0] < AC_OPEN)
	{
		win = Awi_wid(msg[3]);
		if (win->wi_id == proto_win->wi_id)
			return;
		area.x = msg[4];
		area.y = msg[5];
		area.w = msg[6];
		area.h = msg[7];
#ifdef __GNUC__
	} else
	{
		area.x = area.y = area.w = area.h = 0;
#endif
	}
	
	switch (msg[0])
	{
	case MN_SELECTED:
		wprintf(proto_win, "MN_SELECTED\n");
		break;
	case WM_REDRAW:
		wprintf(proto_win, "WM_REDRAW: WiName='%s' X=%d Y=%d W=%d H=%d\n", win->name, area.x, area.y, area.w, area.h);
		break;
	case WM_TOPPED:
		wprintf(proto_win, "WM_TOPPED: WiName='%s'\n", win->name);
		break;
	case WM_CLOSED:
		wprintf(proto_win, "WM_CLOSED: WiName='%s'\n", win->name);
		break;
	case WM_FULLED:
		wprintf(proto_win, "WM_FULLED: WiName='%s'\n", win->name);
		break;
	case WM_ARROWED:
		wprintf(proto_win, "WM_ARROWED: WiName='%s' Arr=%d\n", win->name, msg[4]);
		break;
	case WM_HSLID:
		wprintf(proto_win, "WM_HSLID: WiName='%s' Slid=%d\n", win->name, msg[4]);
		break;
	case WM_VSLID:
		wprintf(proto_win, "WM_VSLID: WiName='%s' Slid=%d\n", win->name, msg[4]);
		break;
	case WM_SIZED:
		wprintf(proto_win, "WM_SIZED: WiName='%s' X=%d Y=%d W=%d H=%d\n", win->name, area.x, area.y, area.w, area.h);
		break;
	case WM_MOVED:
		wprintf(proto_win, "WM_MOVED: WiName='%s' X=%d Y=%d W=%d H=%d\n", win->name, area.x, area.y, area.w, area.h);
		break;
	case WM_UNTOPPED:
#ifdef __GNUC__
		wprintf(proto_win, "WM_UNTOPPED: WiName='%s'\n", win->name);
#else
		wprintf(proto_win, "WM_UNTOPPED: WiName='%s' Slid=%d\n", win->name);
#endif
		break;
	case WM_BOTTOMED:
#ifdef __GNUC__
		wprintf(proto_win, "WM_BOTTOMED: WiName='%s'\n", win->name);
#else
		wprintf(proto_win, "WM_BOTTOMED: WiName='%s' Slid=%d\n", win->name);
#endif
		break;
	case WM_ONTOP:
#ifdef __GNUC__
		wprintf(proto_win, "WM_ONTOP: WiName='%s'\n", win->name);
#else
		wprintf(proto_win, "WM_ONTOP: WiName='%s' Slid=%d\n", win->name);
#endif
		break;
	case WM_NEWTOP:
#ifdef __GNUC__
		wprintf(proto_win, "WM_NEWTOP: WiName='%s'\n", win->name);
#else
		wprintf(proto_win, "WM_NEWTOP: WiName='%s' Slid=%d\n", win->name);
#endif
		break;
	case WM_OFFTOP:
#ifdef __GNUC__
		wprintf(proto_win, "WM_OFFTOP: WiName='%s'\n", win->name);
#else
		wprintf(proto_win, "WM_OFFTOP: WiName='%s' Slid=%d\n", win->name);
#endif
		break;
	case WM_ICONIFY:
		wprintf(proto_win, "WM_ICONIFY: WiName='%s'\n", win->name);
		break;
	case WM_ALLICONIFY:
		wprintf(proto_win, "WM_ALLICONIFY\n");
		break;
	case WM_UNICONIFY:
		wprintf(proto_win, "WM_UNICONIFY: WiName='%s'\n", win->name);
		break;
	case AP_TERM:
		wprintf(proto_win, "AP_TERM\n");
		break;
	case 0x1234:
		wprintf(proto_win, "SC_CHANGED\n");
		break;
	case AC_OPEN:
		wprintf(proto_win, "AC_OPEN\n");
		break;
	case AC_CLOSE:
		wprintf(proto_win, "AC_CLOSE\n");
		break;
	case AV_PROTOKOLL:
		wprintf(proto_win, "AV_PROTOKOLL\n");
		break;
	case VA_PROTOSTATUS:
		wprintf(proto_win, "VA_PROTOSTATUS\n");
		break;
	case AV_GETSTATUS:
		wprintf(proto_win, "AV_GETSTATUS\n");
		break;
	case AV_STATUS:
		wprintf(proto_win, "AV_STATUS\n");
		break;
	case VA_SETSTATUS:
		wprintf(proto_win, "VA_SETSTATUS\n");
		break;
	case AV_SENDKEY:
		wprintf(proto_win, "AV_SENDKEY\n");
		break;
	case VA_START:
		wprintf(proto_win, "VA_START\n");
		break;
	case AV_ASKFILEFONT:
		wprintf(proto_win, "AV_ASKFILEFONT\n");
		break;
	case VA_FILEFONT:
		wprintf(proto_win, "VA_FILEFONT\n");
		break;
	case AV_ASKCONFONT:
		wprintf(proto_win, "AV_ASKCONFONT\n");
		break;
	case VA_CONFONT:
		wprintf(proto_win, "VA_CONFONT\n");
		break;
	case AV_ASKOBJECT:
		wprintf(proto_win, "AV_ASKOBJECT\n");
		break;
	case VA_OBJECT:
		wprintf(proto_win, "VA_OBJECT\n");
		break;
	case AV_OPENCONSOLE:
		wprintf(proto_win, "AV_OPENCONSOLE\n");
		break;
	case VA_CONSOLEOPEN:
		wprintf(proto_win, "VA_CONSOLEOPEN\n");
		break;
	case AV_OPENWIND:
		wprintf(proto_win, "AV_OPENWIND\n");
		break;
	case VA_WINDOPEN:
		wprintf(proto_win, "VA_WINDOPEN\n");
		break;
	case AV_STARTPROG:
		wprintf(proto_win, "AV_STARTPROG\n");
		break;
	case VA_PROGSTART:
		wprintf(proto_win, "VA_PROGSTART\n");
		break;
	case AV_ACCWINDOPEN:
		wprintf(proto_win, "AV_ACCWINDOPEN\n");
		break;
	case VA_DRAGACCWIND:
		wprintf(proto_win, "VA_DRAGACCWIND\n");
		break;
	case AV_ACCWINDCLOSED:
		wprintf(proto_win, "AV_ACCWINDCLOSED\n");
		break;
	case AV_COPY_DRAGGED:
		wprintf(proto_win, "AV_COPY_DRAGGED\n");
		break;
	case VA_COPY_COMPLETE:
		wprintf(proto_win, "VA_COPY_COMPLETE\n");
		break;
	case AV_PATH_UPDATE:
		wprintf(proto_win, "AV_PATH_UPDATE\n");
		break;
	case AV_WHAT_IZIT:
		wprintf(proto_win, "AV_WHAT_IZIT\n");
		break;
	case VA_THAT_IZIT:
		wprintf(proto_win, "VA_THAT_IZIT\n");
		break;
	case AV_DRAG_ON_WINDOW:
		wprintf(proto_win, "AV_DRAG_ON_WINDOW\n");
		break;
	case VA_DRAG_COMPLETE:
		wprintf(proto_win, "VA_DRAG_COMPLETE\n");
		break;
	case AV_EXIT:
		wprintf(proto_win, "AV_EXIT\n");
		break;
	case ACC_ID:
		wprintf(proto_win, "ACC_ID\n");
		break;
	case ACC_OPEN:
		wprintf(proto_win, "ACC_OPEN\n");
		break;
	case ACC_CLOSE:
		wprintf(proto_win, "ACC_CLOSE\n");
		break;
	case ACC_ACC:
		wprintf(proto_win, "ACC_ACC\n");
		break;
	case ACC_EXIT:
		wprintf(proto_win, "ACC_EXIT\n");
		break;
	case ACC_ACK:
		wprintf(proto_win, "ACC_ACK\n");
		break;
	case ACC_TEXT:
		wprintf(proto_win, "ACC_TEXT\n");
		break;
	case ACC_KEY:
		wprintf(proto_win, "ACC_KEY\n");
		break;
	case ACC_META:
		wprintf(proto_win, "ACC_META\n");
		break;
	case ACC_IMG:
		wprintf(proto_win, "ACC_IMG\n");
		break;
	default:
		wprintf(proto_win, "??? Mess-0: %d Mess-1:%d Mess-2:%d\n", msg[0], msg[1], msg[2]);
		break;
	}
}

/* -------------------------------------------------------------------------- */

int16 ACSinit(void)
{
	PROTOCOLDATA proto = { 1, 6, 126, 25, 2, 100, 20, 20 };

#ifdef __GNUC__
	if ((proto_win = get_protocol()->create(&proto)) == NULL)
		return FAIL;
#else
	PROTOCOL.name = " GEM-Messages ";
	
	if ((proto_win = PROTOCOL.create(&proto)) == NULL)
		return FAIL;
#endif
	proto_win->service = proto_service;
#ifdef __GNUC__
	Ast_delete(proto_win->name);
	proto_win->name = Ast_create(" GEM-Messages ");
	Ast_delete(proto_win->iconblk->monoblk.ib_ptext);
	proto_win->iconblk->monoblk.ib_ptext = Ast_create("GemMsgs");
#endif
	
	if (ACSblk->application)
		proto_win->open(proto_win);
	acsmproto = ACSblk->ACSmproto;
	ACSblk->ACSmproto = myproto;
	
	return OK;
}
