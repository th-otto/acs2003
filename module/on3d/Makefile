top_srcdir=../..
EXTRA_DEFS = -D__ACS_MODULE__
include $(top_srcdir)/make.config

LDFLAGS += -nostartfiles

all:: on3d.am

OBJS = acs_load.o on3d.o

on3d.am: $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(OBJS)

clean::
	$(RM) $(OBJS) on3d.am
