dnl Process this file with autoconf to produce a configure script.
AC_INIT([myriadctl], [2020.1.0.4])
AC_CONFIG_SRCDIR([src/myriadctl.c])
AM_INIT_AUTOMAKE
AC_CONFIG_HEADERS(config.h)
AC_SUBST(PACKAGE)
AC_SUBST(VERSION)

if test ${libexecdir} = '${exec_prefix}/libexec'
then
  libexecdir='${exec_prefix}/lib'
  if test "${exec_prefix}" = "NONE"
  then
    TMPFILESDIR=${prefix}/lib/tmpfiles.d
    SYSTEMDDIR=${prefix}/lib/systemd/system
  else
    TMPFILESDIR=${exec_prefix}/lib/tmpfiles.d
    SYSTEMDDIR=${exec_prefix}/lib/systemd/system
  fi
else
  TMPFILESDIR=${libexecdir}/tmpfiles.d
  SYSTEMDDIR=${libexecdir}/systemd/system
fi
AC_SUBST(TMPFILESDIR)
AC_SUBST(SYSTEMDDIR)

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

AC_OUTPUT(Makefile include/Makefile lib/Makefile src/Makefile systemd/Makefile)

