top_srcdir=../..
EXTRA_DEFS = -D__ACS_MODULE__
include $(top_srcdir)/make.config

all:: lupe.am

OBJS = acs_load.o lupe.o

lupe.am: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

clean::
	$(RM) $(OBJS) lupe.am
