top_srcdir=../..
EXTRA_DEFS = -D__ACS_MODULE__
include $(top_srcdir)/make.config

all:: ab_cfg.am

ab_cfg.am: acs_load.o ab_cfg.o
	$(CC) $(CFLAGS) -o $@ acs_load.o ab_cfg.o

clean::
	$(RM) ab_cfg.o acs_load.o
