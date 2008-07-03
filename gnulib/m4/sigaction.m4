# sigaction.m4 serial 3
dnl Copyright (C) 2008 Free Software Foundation, Inc.
dnl This file is free software; the Free Software Foundation
dnl gives unlimited permission to copy and/or distribute it,
dnl with or without modifications, as long as this notice is preserved.

# Determine if sigaction interface is present.
AC_DEFUN([gl_SIGACTION],
[
  AC_REQUIRE([gl_SIGNAL_H_DEFAULTS])
  AC_REPLACE_FUNCS([sigaction])
  if test $ac_cv_func_sigaction = no ; then
    HAVE_SIGACTION=0
    AC_SUBST([HAVE_SIGACTION])
    gl_PREREQ_SIGACTION
  fi
])

# Prerequisites of the part of lib/signal.in.h and of lib/sigaction.c.
AC_DEFUN([gl_PREREQ_SIGACTION],
[
  AC_REQUIRE([gl_SIGNAL_H_DEFAULTS])
  AC_REQUIRE([AC_C_RESTRICT])
  AC_REQUIRE([AC_TYPE_UID_T])
  AC_CHECK_FUNCS_ONCE([sigaltstack siginterrupt])
  AC_CHECK_TYPES([siginfo_t], [], [], [[
#include <signal.h>
  ]])
  if test $ac_cv_type_siginfo_t = no; then
    HAVE_SIGINFO_T=0
    AC_SUBST([HAVE_SIGINFO_T])
  fi
])

# Prerequisites of lib/sig-handler.h.
AC_DEFUN([gl_PREREQ_SIG_HANDLER_H],
[
  AC_REQUIRE([AC_C_INLINE])
  :
])