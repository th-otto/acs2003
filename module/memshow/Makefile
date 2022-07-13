top_srcdir=../..
EXTRA_DEFS = -D__ACS_MODULE__
include $(top_srcdir)/make.config

LDFLAGS += -nostartfiles

all:: memshow.am

OBJS = acs_load.o memshow.o

memshow.am: $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(OBJS)

clean::
	$(RM) $(OBJS) memshow.am
