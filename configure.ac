dnl Process this file with autoconf to produce a configure script.
AC_INIT([myriadctl], [0.1])
AC_CONFIG_SRCDIR([src/myriadctl.c])
AM_INIT_AUTOMAKE
AC_CONFIG_HEADERS(config.h)
AC_SUBST(PACKAGE)
AC_SUBST(VERSION)

dnl Checks for programs.
AC_PROG_CC
dnl If we're using gcc, we want warning flags
#test -n "$GCC" && WARNFLAGS="-Wall"
test -n "$GCC" && WARNFLAGS="-W -Wall -Wbad-function-cast -Wcast-align -Winline -Wmissing-declarations -Wmissing-prototypes -Wnested-externs -Wpointer-arith -Wshadow -Wstrict-prototypes -Wundef"
AC_SUBST(WARNFLAGS)
AC_ISC_POSIX
AC_PROG_INSTALL
AC_PROG_MAKE_SET
AC_PROG_RANLIB
AC_GNU_SOURCE

PKG_CHECK_MODULES([LIBUSB], [libusb-1.0])

AC_OUTPUT(Makefile include/Makefile lib/Makefile src/Makefile)

