CROSS=m68k-atari-mint-

OPT = -O2 -fomit-frame-pointer
WARN = -Wall -Wstrict-prototypes -Wmissing-prototypes -Wno-unused -Werror
CFLAGS = -I. -I../include $(OPT) $(WARN)
CC = $(CROSS)gcc
AS = $(CROSS)gcc


OBJS = \
	acsbase.o \
	palette.o \
	edbehave.o \
	general.o \
	about.o \
	edutil.o \
	\
	io/protocol.o \
	io/fixacs.o \
	io/acsio.o \
	io/rcsin.o \
	io/pc_head.o \
	io/pc_out.o \
	io/pp_out.o \
	io/str_out.o \
	io/workout.o \
	\
	edit2/eddescr.o \
	edit2/eddataed.o \
	edit2/edrefed.o \
	edit2/edaled.o \
	edit2/ediconed.o \
	edit2/edimaged.o \
	edit2/edmoused.o \
	edit2/edusred.o \
	edit2/edteded.o \
	edit2/edstred.o \
	edit2/edwinded.o \
	edit2/edparts.o \
	\
	editor/edobjced.o \
	editor/edmenued.o \
	editor/edpuped.o \
	editor/ueboxed.o \
	editor/ueselect.o \
	editor/ueeditor.o \
	editor/ueslider.o \
	editor/uepictur.o \
	editor/uecycle.o \
	editor/uearrow.o \
	editor/uepatter.o \
	editor/ueinner.o \
	editor/ue3dbutt.o \
	editor/uecheck.o \
	editor/ueftext.o \
	editor/uetitle.o \
	editor/edobclas.o \
	editor/edobstru.o \
	editor/edobsurf.o \
	editor/edobobjc.o \
	editor/edobusrm.o \
	editor/edobboxm.o \
	editor/edobicm.o \
	editor/edobimm.o \
	editor/edobstrm.o \
	editor/edobtedm.o \
	editor/edobaflm.o \
	editor/edobaeom.o \
	editor/edobkeys.o \
	\
	list/edlist.o \
	list/edalert.o \
	list/eddata.o \
	list/edwind.o \
	list/edicon.o \
	list/edimage.o \
	list/eduser.o \
	list/edmenu.o \
	list/edmouse.o \
	list/edobject.o \
	list/edpopup.o \
	list/edref.o \
	list/edstring.o \
	list/edtedi.o \
	\
	acsplus/slider.o \
	acsplus/wislider.o \
	acsplus/editor.o \
	acsplus/pur_desk.o \
	acsplus/editwi.o \
	acsplus/fontsel.o \
	acsplus/list.o \
	acsplus/proto.o \
	\
	lib/main.o \
	lib/initterm.o \
	lib/vdi_data.o \
	lib/mygemdos.o \
	lib/nkcc_s.o \
	lib/nkcc.o \
	lib/config.o \
	lib/string.o \
	lib/drag.o \
	lib/event.o \
	lib/fileutil.o \
	lib/memory.o \
	lib/menu.o \
	lib/mouse.o \
	lib/object.o \
	lib/wobject.o \
	lib/backplan.o \
	lib/window.o \
	lib/shelutil.o \
	lib/thermo.o \
	lib/keytab.o \
	lib/messages/msgserv.o \
	lib/messages/screen.o \
	lib/messages/xacc.o \
	lib/messages/av.o \
	lib/messages/dd.o \
	lib/messages/dhst.o \
	lib/messages/bubble.o \
	lib/messages/gemscr.o \
	lib/messages/olga.o \
	lib/messages/stguide.o \
	lib/messages/seproto.o \
	lib/messages/ssp.o \
	lib/messages/pc_help.o \
	lib/userdef/userobj.o \
	lib/userdef/userobj2.o \
	lib/userdef/ftext.o \
	lib/userdef/cycle.o \
	lib/userdef/picture.o \
	lib/userdef/boxed.o \
	lib/utility/util.o \
	lib/utility/date.o \
	lib/wdialog/filesel.o \
	lib/wdialog/printsel.o \
	lib/wdialog/fontsel.o \
	lib/listen/ulinlist.o \
	lib/modul/modul.o \
	lib/modul/modulold.o \
	\
	lib/gemlib.o \
	rest.o \
	\
	$(empty)

.s.o:
	$(CC) -c -o $@ $(CFLAGS) $<

all: acs.app

acs.app: $(OBJS) Makefile
	$(CC) $(CFLAGS) -o $@ $(OBJS) -lgem


#$(OBJS): acs_i.h

clean::
	$(RM) $(OBJS) acs.app
