top_srcdir=../..
EXTRA_DEFS = -D__ACS_MODULE__
include $(top_srcdir)/make.config

LDFLAGS += -nostartfiles

all:: rechner.am

OBJS = acs_load.o rechner.o

rechner.am: $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(OBJS)

clean::
	$(RM) $(OBJS) rechner.am
