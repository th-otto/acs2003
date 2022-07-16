top_srcdir=../..
include $(top_srcdir)/make.config

all:: cews.ama cews.app

OBJS = acs_load.o cews_m.o

cews.ama: $(OBJS)
	$(CC) $(CFLAGS) -nostartfiles $(LDFLAGS) -o $@ $(OBJS)

cews.app: cews.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ cews.o ../../src/acsplus/acsplus.a ../../src/lib/acsmodno.a ../../src/lib/acs.a -lgem

clean::
	$(RM) *.o cews.ama cews.app
