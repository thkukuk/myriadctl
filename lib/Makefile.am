noinst_LIBRARIES = libmyriad.a

AM_CFLAGS = -DNO_BOOT=1 -D_REENTRANT=1 @WARNFLAGS@
AM_CPPFLAGS = -I$(srcdir) -I$(srcdir)/../include @LIBUSB_CFLAGS@

libmyriad_a_SOURCES = mvnc_api.c mvnc_data.c mvStringUtils.c pcie_host.c \
	usb_boot.c XLink.c XLinkDispatcher.c XLinkPlatform.c

CLEANFILES = *~

