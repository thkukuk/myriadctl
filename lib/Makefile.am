noinst_LIBRARIES = libmyriad.a

AM_CFLAGS = -D__PC__=1 -D_REENTRANT=1 @WARNFLAGS@
AM_CPPFLAGS = -I$(srcdir) -I$(srcdir)/../include @LIBUSB_CFLAGS@

libmyriad_a_SOURCES = mvnc_api.c mvnc_data.c pcie_host.c PlatformData.c \
	PlatformDeviceControl.c PlatformDeviceSearch.c usb_boot.c \
	XLinkData.c XLinkDeprecated.c XLinkDevice.c XLinkDispatcher.c \
	XLinkDispatcherImpl.c XLinkPrivateDefines.c XLinkPrivateFields.c \
	XLinkStream.c XLinkStringUtils.c

CLEANFILES = *~

