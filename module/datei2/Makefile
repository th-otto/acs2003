top_srcdir=../..
EXTRA_DEFS = -D__ACS_MODULE__
include $(top_srcdir)/make.config

all:: datei2.am

OBJS = acs_load.o datei2.o

datei2.am: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

clean::
	$(RM) $(OBJS) datei2.am
