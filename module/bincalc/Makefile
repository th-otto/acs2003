top_srcdir=../..
EXTRA_DEFS = -D__ACS_MODULE__
include $(top_srcdir)/make.config

all:: bincalc.am

OBJS = acs_load.o bincalc.o

bincalc.am: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

clean::
	$(RM) $(OBJS) bincalc.am
