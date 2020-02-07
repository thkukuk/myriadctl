WARNFLAGS = @WARNFLAGS@
AM_CFLAGS = -D_REENTRANT=1 $(WARNFLAGS) @LIBUSB_CFLAGS@ -I$(srcdir)/../include
myriadctl_LDADD = ../lib/libmyriad.a @LIBUSB_LIBS@ -lpthread -ldl

CLEANFILES = *~

sbin_PROGRAMS = myriadctl

myriadctl_SOURCES = myriadctl.c

