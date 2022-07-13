top_srcdir=../..
EXTRA_DEFS = -D__ACS_MODULE__
include $(top_srcdir)/make.config

LDFLAGS += -nostartfiles

all:: ab_cfg.am

OBJS = acs_load.o ab_cfg.o

ab_cfg.am: $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(OBJS)

clean::
	$(RM) $(OBJS) ab_cfg.am
