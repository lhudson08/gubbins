AC_INIT([gubbins], m4_esyscmd([tr -d '\n' < VERSION]), [gubbins@sanger.ac.uk], [$(PACKAGE_NAME)$(AC_PACKAGE_VERSION)], [https://github.com/sanger-pathogens/gubbins])

AM_INIT_AUTOMAKE([foreign tar-pax subdir-objects])
AC_CONFIG_SRCDIR([configure.ac])
AC_CONFIG_HEADERS([config.h])

# Add our own macro dir, so we can check for PTHREAD
AC_CONFIG_MACRO_DIR([m4])

AC_CANONICAL_HOST

case $host_os in
	*linux*)
		HOST_OS=linux
		;;
	*) ;;
esac
AM_CONDITIONAL([HOST_LINUX],[test x$HOST_OS = xlinux])

AC_PROG_LIBTOOL
AC_PROG_CC
AC_PROG_CXX

# Checks for pthread
AX_PTHREAD

# Ensure zlib is available
PKG_CHECK_MODULES([zlib], [zlib])
AC_CHECK_HEADERS([zlib.h math.h])

# Check for Python
AM_PATH_PYTHON([3.0],
               [],
               [AC_MSG_WARN([Python not found. Python is required to build presage python binding. Python can be obtained from http://www.python.org])])

# Define a new recursive target. In our case it produces a .deb installable.
#AM_EXTRA_RECURSIVE_TARGETS([release])

AC_CONFIG_FILES([Makefile src/Makefile release/Makefile python/Makefile])
AC_OUTPUT


