top_srcdir=..
include $(top_srcdir)/make.config

LIBS = ../src/lib/acsmod.a ../src/acsplus/acsplus.a ../src/lib/acs.a
OBJS = acs_view.o

all:: acs-view.app

acs-view.app: $(OBJS) Makefile
	$(CC) $(CFLAGS) -o $@ $(OBJS) $(LIBS) -lgem

clean::
	$(RM) *.o *.app
