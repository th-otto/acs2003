top_srcdir=../..
EXTRA_DEFS = -D__ACS_MODULE__
include $(top_srcdir)/make.config

all:: no3d.am

OBJS = acs_load.o no3d.o

no3d.am: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

clean::
	$(RM) $(OBJS) no3d.am
