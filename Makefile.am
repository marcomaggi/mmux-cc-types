## Process this file with automake to produce Makefile.in

ACLOCAL_AMFLAGS		= -I meta/autotools
AUTOMAKE_OPTIONS	= foreign
EXTRA_DIST		= INSTALL meta/slackware/slack-desc.in \
EXTRA_DIST		+= meta/m4/libmmux-bash-builtins.m4 src/mmux-bash-pointers-config.m4.in
dist_doc_DATA		= README COPYING
AM_CFLAGS		= $(MMUX_CFLAGS)
AM_CPPFLAGS		= -I$(srcdir)/src
CLEANFILES		=
DISTCLEANFILES		=
BUILT_SOURCES		=

## --------------------------------------------------------------------

nodist_pkgconfig_DATA	= meta/scripts/mmux-bash-pointers.pc


#### MBFL stuff

AM_MBFLPP_FLAGS		= --bash-program="$(BASH_PROGRAM)" --define=__MBFL_LIBDIR__=$(MBFL_LIBDIR) --define=__LIBMBFL_LINKER__=$(MBFL_LIBMBFL_LINKER)
MBFLPP_PROG_FLAGS	= $(AM_MBFLPP_FLAGS) --add-bash

# We must make sure that these end with a semicolon.
MBFLPP_PROG_ENV		= MBFL_LIBRARY_PATH=$(builddir)/src/share/mbfl; export MBFL_LIBRARY_PATH;

MBFLPP_PROG_RUN		= $(MBFLPP_PROG_ENV) $(MBFLPP) $(MBFLPP_PROG_FLAGS) $(MBFLPP_FLAGS)


#### Automake dirstamp files

MMUX_AM_DIRSTAMP_FILES	= \
	tests/$(am__dirstamp)

BUILT_SOURCES		+= $(MMUX_AM_DIRSTAMP_FILES)
DISTCLEANFILES		+= $(MMUX_AM_DIRSTAMP_FILES)

tests/$(am__dirstamp):
	@$(MKDIR_P) tests/
	@: > $(@)


#### documentation

EXTRA_DIST		+= doc/mmux-bash-pointers.style.css
CLEANFILES		+= doc/mmux-bash-pointers.css

AM_MAKEINFOFLAGS	= --no-split
AM_MAKEINFOHTMLFLAGS	= --split=node -c WORDS_IN_PAGE=0 --css-ref=mmux-bash-pointers.css \
	-c PRE_BODY_CLOSE="<p>This document describes version <tt>$(PACKAGE_VERSION)</tt> of <em>$(PACKAGE_NAME)</em>.</p>"

info_TEXINFOS		= doc/mmux-bash-pointers.texi
doc_mmux_bash_pointers_TEXINFOS	= \
	doc/macros.texi			\
	doc/overview-linking.texi	\
	doc/lgpl-3.0.texi		\
	doc/fdl-1.3.texi

## --------------------------------------------------------------------

doc/mmux-bash-pointers.html/$(am__dirstamp): doc/$(am__dirstamp)
	@$(MKDIR_P) doc/mmux-bash-pointers.html/
	@: > doc/mmux-bash-pointers.html/$(am__dirstamp)

doc/mmux-bash-pointers.html/mmux-bash-pointers.css: \
	doc/mmux-bash-pointers.style.css doc/mmux-bash-pointers.html/$(am__dirstamp)
	$(INSTALL) -m 0444 "$(top_srcdir)/doc/mmux-bash-pointers.style.css" "$(builddir)/doc/mmux-bash-pointers.html/mmux-bash-pointers.css"

## --------------------------------------------------------------------

html-local: doc/mmux-bash-pointers.html/mmux-bash-pointers.css

install-html-local:
	$(MKDIR_P) "$(DESTDIR)$(htmldir)/mmux-bash-pointers.html/"
	$(INSTALL) -m 0444 $(builddir)/doc/mmux-bash-pointers.html/mmux-bash-pointers.css "$(DESTDIR)$(htmldir)/mmux-bash-pointers.html/"


#### libraries

EXTRA_DIST	+= \
	src/mmux-bash-pointers.h.m4		\
	src/mmux-bash-pointers-accessors.c.m4	\
	src/mmux-bash-pointers-errors.c.m4	\
	src/mmux-bash-pointers-library.c.m4	\
	src/mmux-bash-pointers-memory.c.m4	\
	src/mmux-bash-pointers-mutators.c.m4	\
	src/mmux-bash-pointers-parsers.c.m4	\
	src/mmux-bash-pointers-predicates.c.m4	\
	src/mmux-bash-pointers-sprinters.c.m4	\
	src/mmux-bash-pointers-types.c.m4

MMUX_BASH_POINTERS_BUILT_SOURCES	= \
	src/mmux-bash-pointers.h		\
	src/mmux-bash-pointers-accessors.c	\
	src/mmux-bash-pointers-errors.c		\
	src/mmux-bash-pointers-library.c	\
	src/mmux-bash-pointers-memory.c		\
	src/mmux-bash-pointers-mutators.c	\
	src/mmux-bash-pointers-parsers.c	\
	src/mmux-bash-pointers-predicates.c	\
	src/mmux-bash-pointers-sprinters.c	\
	src/mmux-bash-pointers-types.c

MMUX_BASH_POINTERS_BUILT_SOURCES_PREREQUISITES = \
	$(top_srcdir)/meta/m4/libmmux-bash-builtins.m4	\
	$(builddir)/src/mmux-bash-pointers-config.m4

BUILT_SOURCES	+= $(MMUX_BASH_POINTERS_BUILT_SOURCES)
CLEANFILES	+= $(MMUX_BASH_POINTERS_BUILT_SOURCES)
DISTCLEANFILES	+= $(MMUX_BASH_POINTERS_BUILT_SOURCES)

mmux_bash_pointers_CURRENT		= @mmux_bash_pointers_VERSION_INTERFACE_CURRENT@
mmux_bash_pointers_REVISION		= @mmux_bash_pointers_VERSION_INTERFACE_REVISION@
mmux_bash_pointers_AGE			= @mmux_bash_pointers_VERSION_INTERFACE_AGE@
mmux_bash_pointers_LINKER_VERSION	= \
	-version-info $(mmux_bash_pointers_CURRENT):$(mmux_bash_pointers_REVISION):$(mmux_bash_pointers_AGE)

include_HEADERS				= src/mmux-bash-pointers.h

lib_LTLIBRARIES				= libmmux-bash-pointers.la
libmmux_bash_pointers_la_CPPFLAGS	= $(AM_CPPFLAGS) -I$(builddir)/src
libmmux_bash_pointers_la_CFLAGS		= $(AM_CFLAGS) $(BASH_CFLAGS)
libmmux_bash_pointers_la_LDFLAGS	= $(mmux_bash_pointers_LINKER_VERSION) $(AM_LDFLAGS)
libmmux_bash_pointers_la_SOURCES	=	\
	src/mmux-bash-pointers.h		\
	src/mmux-bash-pointers-internals.h	\
	src/mmux-bash-pointers-accessors.c	\
	src/mmux-bash-pointers-errors.c		\
	src/mmux-bash-pointers-library.c	\
	src/mmux-bash-pointers-memory.c		\
	src/mmux-bash-pointers-mutators.c	\
	src/mmux-bash-pointers-parsers.c	\
	src/mmux-bash-pointers-predicates.c	\
	src/mmux-bash-pointers-sprinters.c	\
	src/mmux-bash-pointers-types.c

.PHONY: library

library: libmmux-bash-pointers.la

src/%.h: src/%.h.m4 $(MMUX_BASH_POINTERS_BUILT_SOURCES_PREREQUISITES)
	$(M4_PROGRAM) --prefix-builtins $(MMUX_BASH_POINTERS_BUILT_SOURCES_PREREQUISITES) $< >$@

src/%.c: src/%.c.m4 $(MMUX_BASH_POINTERS_BUILT_SOURCES_PREREQUISITES)
	$(M4_PROGRAM) --prefix-builtins $(MMUX_BASH_POINTERS_BUILT_SOURCES_PREREQUISITES) $< >$@

src/%.$(OBJEXT): src/mmux-bash-pointers.h src/mmux-bash-pointers-internals.h

## ------------------------------------------------------------------------

mmux_bashlib_DATA	= src/libmmux-bash-pointers.bash
mmux_bashlibdir		= $(datadir)/bash


#### tests

EXTRA_DIST		+= \
	tests/version.test.m4			\
	tests/types.test.m4			\
	tests/memory.test.m4			\
	tests/errors.test.m4			\
	tests/pointers.test.m4			\
	tests/arrays.test.m4			\
	tests/conversion.test.m4

MMUX_CHECK_BUILT_TESTS	= \
	tests/version.test			\
	tests/types.test			\
	tests/memory.test			\
	tests/errors.test			\
	tests/pointers.test			\
	tests/arrays.test			\
	tests/conversion.test

if MMUX_BASH_TESTING_ENABLED
TESTS			= $(MMUX_CHECK_BUILT_TESTS)
endif
check_SCRIPTS		= $(MMUX_CHECK_BUILT_TESTS)
CLEANFILES		+= $(MMUX_CHECK_BUILT_TESTS)
MMUX_LIBRARY		= $(builddir)/src/libmmux-bash-pointers.bash

## --------------------------------------------------------------------

MBFL_TESTS_VERBENV	= TESTSUCCESS=yes; export TESTSUCCESS; TESTSTART=yes; export TESTSTART;

# This  environment setting  is used  both  to compile  ".test.m4" files  and to  run
# ".test" files.
#
MBFL_TESTS_ENV		= MBFL_LIBRARY_PATH=$(builddir)/src/share/mbfl; export MBFL_LIBRARY_PATH;
# We set TMPDIR  because if the "/tmp"  directory is mounted on  a separate partition
# with  "noexec"  attribute: tests  for  executability  of  files  will fail  if  the
# temporary test files are created under "/tmp".
MBFL_TESTS_ENV		+= TMPDIR=$(PWD)/tmp; export TMPDIR;
MBFL_TESTS_ENV		+= testsdir=$(builddir)/tests; export testsdir;
MBFL_TESTS_ENV		+= TESTMATCH=$(TESTMATCH); export TESTMATCH;
MBFL_TESTS_ENV		+= export MMUX_LIBRARY=$(MMUX_LIBRARY);
MBFL_TESTS_ENV		+= export LD_LIBRARY_PATH=$(builddir)/.libs/:$(LD_LIBRARY_PATH);
MBFL_TESTS_COMPILE	= $(MBFL_TESTS_ENV) $(MBFLPP_PROG_RUN)
MBFL_TESTS_FLAGS	= $(MBFLPP_GENERAL_FLAGS)

MBFL_TESTS_PREREQUISITES= $(MMUX_LIBRARY) libmmux-bash-pointers.la

# Read "Parallel Test Harness" in the documentation of GNU Automake to
# understand how to use this interface for "make check".
#
# We must make sure that this ends with a semicolon!!!
AM_TESTS_ENVIRONMENT	= $(MBFL_TESTS_VERBENV) $(MBFL_TESTS_ENV)
TEST_EXTENSIONS		= .test
TEST_LOG_COMPILER	= $(BASH_PROGRAM)
AM_TEST_LOG_FLAGS	= $(MBFLFLAGS)

## --------------------------------------------------------------------

tests/%.test: tests/%.test.m4 $(MBFL_TESTS_PREREQUISITES)
	$(MBFL_TESTS_COMPILE) $(MBFL_TESTS_FLAGS) $< >$@


#### interface to "make installcheck"

# This  thing with  the PATH  environment  variable is  needed to  run
# distcheck successfully.   We need  to remember  that, for  some sick
# reason, the  Bash built-in "source"  will search for the  file under
# PATH's directories.
#
MBFL_ICHECK_ENV	 = PATH=$(DESTDIR)$(bindir):$$PATH; export PATH;
MBFL_ICHECK_ENV	+= TMPDIR=$(PWD)/tmp; export TMPDIR;
MBFL_ICHECK_ENV	+= testsdir=$(builddir)/tests; export testsdir;
MBFL_ICHECK_ENV	+= export MMUX_LIBRARY=$(DESTDIR)$(mmux_bashlibdir)/libmmux-bash-pointers.bash
MBFL_ICHECK_ENV	+= export LD_LIBRARY_PATH=$(DESTDIR)$(libdir):$(LD_LIBRARY_PATH)
MBFL_ICHECK_RUN	 = $(BASH_PROGRAM) $(MBFL_ICHECK_FLAGS)

# If a  test script executes no  test functions: its exit  code is 77,
# which signals  GNU Automake's  test harness that  the test  has been
# skipped.  This is fine when running  "make check", but will cause an
# error when  running "make installcheck";  so we intercept  that exit
# code and normalise it to 0.
#
# We  want  to support  the  case  of  a  ".test" script  being  under
# "$(srcdir)" rather than under "$(builddir)"; so we look for the file
# in both directories.
#
installcheck-local: $(TESTS)
	$(MBFL_ICHECK_ENV) RV=0					;\
	for FILE in $(TESTS)					;\
	do  echo "running: '$(builddir)/$$FILE'"		;\
	    if ! $(MBFL_ICHECK_RUN) "$(builddir)/$$FILE"	;\
	    then RV=$$?; break					;\
	    fi							;\
	done							;\
	if test "$$RV" = 77; then exit 0; else exit $$RV; fi	;


#### common rules

include $(top_srcdir)/meta/automake/mmux-makefile-rules

### end of file
