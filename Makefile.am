## Process this file with automake to produce Makefile.in

ACLOCAL_AMFLAGS		= -I meta/autotools
AUTOMAKE_OPTIONS	= foreign
EXTRA_DIST		= INSTALL
dist_doc_DATA		= README COPYING
AM_CFLAGS		= $(MMUX_CFLAGS)
AM_CPPFLAGS		= -I$(srcdir)/src/ -I$(builddir)/src/ -I$(builddir)/mmux-cc-types/src
CLEANFILES		=
DISTCLEANFILES		=
BUILT_SOURCES		=

SUBDIRS			= mmux-cc-types

## --------------------------------------------------------------------

nodist_pkgconfig_DATA	= meta/scripts/mmux-bash-pointers.pc

## ------------------------------------------------------------------------

MBFLPP_PROG_FLAGS	= --bash-program="$(BASH_PROGRAM)" --define=__MBFL_LIBDIR__=$(MBFL_LIBDIR)
MBFLPP_PROG_FLAGS	+= --define=__LIBMBFL_LINKER__=$(MBFL_LIBMBFL_LINKER) --add-bash
MBFLPP_PROG_ENV		= MBFL_LIBRARY_PATH=$(builddir)/src/share/mbfl; export MBFL_LIBRARY_PATH;
MBFLPP_PROG_RUN		= $(MBFLPP_PROG_ENV) $(MBFLPP) $(MBFLPP_PROG_FLAGS) $(MBFLPP_FLAGS)


#### GNU m4 macros

EXTRA_DIST		+= \
	$(top_srcdir)/src/m4/macros-for-cc.m4	\
	$(top_srcdir)/src/m4/macros-for-bash.m4	\
	$(top_srcdir)/src/m4/mmux-bash-pointers-config.m4.in

MMUX_M4_FLAGS		=  $(M4FLAGS) --prefix-builtins --include=$(srcdir)/src/m4/
MMUX_M4_FLAGS		+= --include=$(builddir)/src/ --include=$(builddir)/src/m4

# These  are  used  to  preprocess C  language  files  with  extension
# ".c.m4".  Do not change the order of inclusion!!!
#
MMUX_M4_CC_MACROS	= \
	$(top_srcdir)/src/m4/macros-for-cc.m4

# These  are  used  to  preprocess   GNU  Bash  files  with  extension
# ".bash.m4".  Do not change the order of inclusion!!!
#
MMUX_M4_BASH_MACROS	= \
	$(top_srcdir)/src/m4/macros-for-bash.m4	\
	$(builddir)/src/m4/mmux-bash-pointers-config.m4


#### Automake dirstamp files

MMUX_AM_DIRSTAMP_FILES	= \
	src/m4/$(am__dirstamp)	\
	tests/$(am__dirstamp)

BUILT_SOURCES		+= $(MMUX_AM_DIRSTAMP_FILES)
DISTCLEANFILES		+= $(MMUX_AM_DIRSTAMP_FILES)

src/m4/$(am__dirstamp):
	@$(MKDIR_P) src/m4/
	@: > $(@)

tests/$(am__dirstamp):
	@$(MKDIR_P) tests/
	@: > $(@)


#### support for GNU Emacs

if WANT_EMACS
sharelispdir		= $(datadir)/emacs/site-lisp
dist_sharelisp_LISP	= src/emacs/mmux-bash-packages.el src/emacs/mmux-bash-pointers.el
endif


#### documentation

AM_MAKEINFOFLAGS	= --no-split
AM_MAKEINFOHTMLFLAGS	= --split=node -c WORDS_IN_PAGE=0 --css-ref=mmux-bash-pointers.css \
	-c PRE_BODY_CLOSE="<p>This document describes version <tt>$(PACKAGE_VERSION)</tt> of <em>$(PACKAGE_NAME)</em>.</p>"

info_TEXINFOS		= doc/mmux-bash-pointers.texi

EXTRA_DIST		+= doc/mmux-bash-pointers.style.css
CLEANFILES		+= doc/mmux-bash-pointers.css

doc_mmux_bash_pointers_TEXINFOS	= \
	doc/macros.texi			\
	doc/overview-linking.texi	\
	doc/mmux-version.texi		\
	doc/gpl-3.0.texi		\
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


#### shell libraries

EXTRA_DIST		+= \
	src/libmmux-bash-packages.bash.m4			\
	src/libmmux-bash-pointers.bash.m4			\
	$(top_srcdir)/meta/scripts/print-builtin-names.bash

MMUX_SHELL_LIBFILES	 = \
	src/libmmux-bash-packages.bash		\
	src/libmmux-bash-pointers.bash

BUILT_SOURCES		+= src/mmux-bash-pointers-builtin-definitions.bash
CLEANFILES		+= $(MMUX_SHELL_LIBFILES) src/mmux-bash-pointers-builtin-definitions.bash
mmuxbashlib_DATA	=  $(MMUX_SHELL_LIBFILES)
mmuxbashlibdir		=  $(datadir)/bash

src/mmux-bash-pointers-builtin-definitions.bash: $(top_srcdir)/meta/scripts/print-builtin-names.bash
	export CONFIG_H_FILE=$(builddir)/config.h; $(BASH_PROGRAM) $< >$@

src/libmmux-bash-pointers.bash: src/mmux-bash-pointers-builtin-definitions.bash

src/libmmux-bash-%.bash: src/libmmux-bash-%.bash.m4 $(MMUX_M4_BASH_MACROS)
	$(M4_PROGRAM) $(MMUX_M4_FLAGS) $(MMUX_M4_BASH_MACROS) $< >$@


#### libraries

EXTRA_DIST	+= \
	src/mmux-bash-pointers.h.m4			\
	src/mmux-bash-pointers-internals.h.m4		\
	src/mmux-bash-pointers-accessors.c.m4		\
	src/mmux-bash-pointers-arithmetics.c.m4		\
	src/mmux-bash-pointers-bash.c.m4		\
	src/mmux-bash-pointers-bind-functions.c.m4	\
	src/mmux-bash-pointers-bitwise.c.m4		\
	src/mmux-bash-pointers-comparison.c.m4		\
	src/mmux-bash-pointers-errors.c.m4		\
	src/mmux-bash-pointers-file-descriptors.c.m4	\
	src/mmux-bash-pointers-file-system.c.m4		\
	src/mmux-bash-pointers-library.c.m4		\
	src/mmux-bash-pointers-mathematics.c.m4		\
	src/mmux-bash-pointers-memory.c.m4		\
	src/mmux-bash-pointers-misc-builtins.c.m4	\
	src/mmux-bash-pointers-mutators.c.m4		\
	src/mmux-bash-pointers-persona.c.m4		\
	src/mmux-bash-pointers-predicates.c.m4		\
	src/mmux-bash-pointers-strings.c.m4		\
	src/mmux-bash-pointers-time.c.m4

MMUX_BASH_POINTERS_BUILT_SOURCES	= \
	src/mmux-bash-pointers.h			\
	src/mmux-bash-pointers-internals.h		\
	src/mmux-bash-pointers-accessors.c		\
	src/mmux-bash-pointers-arithmetics.c		\
	src/mmux-bash-pointers-bash.c			\
	src/mmux-bash-pointers-bind-functions.c		\
	src/mmux-bash-pointers-bitwise.c		\
	src/mmux-bash-pointers-comparison.c		\
	src/mmux-bash-pointers-errors.c			\
	src/mmux-bash-pointers-file-descriptors.c	\
	src/mmux-bash-pointers-file-system.c		\
	src/mmux-bash-pointers-library.c		\
	src/mmux-bash-pointers-mathematics.c		\
	src/mmux-bash-pointers-memory.c			\
	src/mmux-bash-pointers-misc-builtins.c		\
	src/mmux-bash-pointers-mutators.c		\
	src/mmux-bash-pointers-persona.c		\
	src/mmux-bash-pointers-predicates.c		\
	src/mmux-bash-pointers-strings.c		\
	src/mmux-bash-pointers-time.c

BUILT_SOURCES	+= $(MMUX_BASH_POINTERS_BUILT_SOURCES)
CLEANFILES	+= $(MMUX_BASH_POINTERS_BUILT_SOURCES)
DISTCLEANFILES	+= $(MMUX_BASH_POINTERS_BUILT_SOURCES)

mmux_bash_pointers_CURRENT	= @mmux_bash_pointers_VERSION_INTERFACE_CURRENT@
mmux_bash_pointers_REVISION	= @mmux_bash_pointers_VERSION_INTERFACE_REVISION@
mmux_bash_pointers_AGE		= @mmux_bash_pointers_VERSION_INTERFACE_AGE@
mmux_bash_pointers_LINKER_VERSION= -version-info $(mmux_bash_pointers_CURRENT):$(mmux_bash_pointers_REVISION):$(mmux_bash_pointers_AGE)

include_HEADERS				= \
	src/mmux-bash-pointers.h			\
	src/mmux-bash-pointers-config.h

lib_LTLIBRARIES				= libmmux-bash-pointers.la
libmmux_bash_pointers_la_CPPFLAGS	= $(AM_CPPFLAGS) -I$(builddir)/src
libmmux_bash_pointers_la_CFLAGS		= $(AM_CFLAGS) $(BASH_CFLAGS)
libmmux_bash_pointers_la_LDFLAGS	= $(mmux_bash_pointers_LINKER_VERSION) $(AM_LDFLAGS)
libmmux_bash_pointers_la_LIBADD		= mmux-cc-types/libmmux-cc-types.la
libmmux_bash_pointers_la_SOURCES	= \
	src/mmux-bash-pointers.h			\
	src/mmux-bash-pointers-config.h			\
	src/mmux-bash-pointers-accessors.c		\
	src/mmux-bash-pointers-arithmetics.c		\
	src/mmux-bash-pointers-bash.c			\
	src/mmux-bash-pointers-bind-functions.c		\
	src/mmux-bash-pointers-bitwise.c		\
	src/mmux-bash-pointers-comparison.c		\
	src/mmux-bash-pointers-errors.c			\
	src/mmux-bash-pointers-file-descriptors.c	\
	src/mmux-bash-pointers-file-system.c		\
	src/mmux-bash-pointers-internals.h		\
	src/mmux-bash-pointers-library.c		\
	src/mmux-bash-pointers-mathematics.c		\
	src/mmux-bash-pointers-memory.c			\
	src/mmux-bash-pointers-misc-builtins.c		\
	src/mmux-bash-pointers-mutators.c		\
	src/mmux-bash-pointers-persona.c		\
	src/mmux-bash-pointers-predicates.c		\
	src/mmux-bash-pointers-strings.c		\
	src/mmux-bash-pointers-time.c

.PHONY: library

library: libmmux-bash-pointers.la

src/%.h: src/%.h.m4 $(MMUX_M4_CC_MACROS)
	$(M4_PROGRAM) $(MMUX_M4_FLAGS) $(MMUX_M4_CC_MACROS) $< >$@

src/%.c: src/%.c.m4 $(MMUX_M4_CC_MACROS)
	$(M4_PROGRAM) $(MMUX_M4_FLAGS) $(MMUX_M4_CC_MACROS) $< >$@

src/%.$(OBJEXT): \
	src/mmux-bash-pointers.h		\
	src/mmux-bash-pointers-internals.h	\
	src/mmux-bash-pointers-config.h


#### tests

EXTRA_DIST		+= \
	tests/arithmetics.test.m4		\
	tests/arrays.test.m4			\
	tests/bitwise.test.m4			\
	tests/comparison.test.m4		\
	tests/complex.test.m4			\
	tests/conversion.test.m4		\
	tests/errors.test.m4			\
	tests/file-descriptors.test.m4		\
	tests/file-system.test.m4		\
	tests/mathematics.test.m4		\
	tests/memory.test.m4			\
	tests/output-formats.test.m4		\
	tests/packages.test.m4			\
	tests/persona.test.m4			\
	tests/pointers.test.m4			\
	tests/predicates.test.m4		\
	tests/strings.test.m4			\
	tests/structs.test.m4			\
	tests/time.test.m4			\
	tests/types.test.m4			\
	tests/version.test.m4

# For some reason  GNU Automake does not want  "TEST_EXTENSIONS" to be
# inside a conditional; so we put it here.
TEST_EXTENSIONS		= .test

if WANT_MBFL_TESTING_ENABLED

MMUX_CHECK_BUILT_TESTS	= \
	tests/arithmetics.test			\
	tests/arrays.test			\
	tests/bitwise.test			\
	tests/comparison.test			\
	tests/complex.test			\
	tests/conversion.test			\
	tests/errors.test			\
	tests/file-descriptors.test		\
	tests/file-system.test			\
	tests/mathematics.test			\
	tests/memory.test			\
	tests/output-formats.test		\
	tests/packages.test			\
	tests/persona.test			\
	tests/pointers.test			\
	tests/predicates.test			\
	tests/strings.test			\
	tests/structs.test			\
	tests/time.test				\
	tests/types.test			\
	tests/version.test

TESTS			= $(MMUX_CHECK_BUILT_TESTS)
check_SCRIPTS		= $(MMUX_CHECK_BUILT_TESTS)
CLEANFILES		+= $(MMUX_CHECK_BUILT_TESTS)

## --------------------------------------------------------------------

# This environment  setting is used  both to compile  ".test.m4" files
# and to run ".test" files.
#
MBFL_TESTS_ENV		= export MBFL_LIBRARY_PATH=$(builddir)/src:$(MBFL_LIBRARY_PATH);
# We  set TMPDIR  because  if the  "/tmp" directory  is  mounted on  a
# separate partition with "noexec"  attribute: tests for executability
# of files  will fail if  the temporary  test files are  created under
# "/tmp".
MBFL_TESTS_ENV		+= TMPDIR=$(PWD)/tmp; export TMPDIR;
MBFL_TESTS_ENV		+= testsdir=$(builddir)/tests; export testsdir;
MBFL_TESTS_ENV		+= TESTMATCH=$(TESTMATCH); export TESTMATCH;
MBFL_TESTS_ENV		+= export LD_LIBRARY_PATH=$(builddir)/.libs/:$(LD_LIBRARY_PATH);
MBFL_TESTS_COMPILE	= $(MBFL_TESTS_ENV) $(MBFLPP_PROG_RUN)
MBFL_TESTS_FLAGS	= $(MBFLPP_GENERAL_FLAGS)

MBFL_TESTS_PREREQUISITES= \
	libmmux-bash-pointers.la			\
	$(builddir)/src/libmmux-bash-packages.bash	\
	$(builddir)/src/libmmux-bash-pointers.bash

tests/%.test: tests/%.test.m4 $(MBFL_TESTS_PREREQUISITES)
	$(MBFL_TESTS_COMPILE) $(MBFL_TESTS_FLAGS) $< >$@

## ------------------------------------------------------------------------

MBFL_TESTS_RUN_VERBENV	= TESTSUCCESS=yes; export TESTSUCCESS; TESTSTART=yes; export TESTSTART;
MBFL_TESTS_RUN_ENV	= $(MBFL_TESTS_ENV)
# Read "Parallel Test Harness" in the documentation of GNU Automake to
# understand how to use this interface for "make check".
#
# We must make sure that this ends with a semicolon!!!
AM_TESTS_ENVIRONMENT	= $(MBFL_TESTS_RUN_VERBENV) $(MBFL_TESTS_RUN_ENV)
TEST_LOG_COMPILER	= $(BASH_PROGRAM)
AM_TEST_LOG_FLAGS	= $(MBFLFLAGS)

## --------------------------------------------------------------------

endif


#### interface to "make installcheck"

if WANT_MBFL_TESTING_ENABLED

# This  thing with  the PATH  environment  variable is  needed to  run
# distcheck successfully.   We need  to remember  that, for  some sick
# reason, the  Bash built-in "source"  will search for the  file under
# PATH's directories.
#
MBFL_ICHECK_ENV	 = PATH=$(DESTDIR)$(bindir):$$PATH; export PATH;
MBFL_ICHECK_ENV	+= TMPDIR=$(PWD)/tmp; export TMPDIR;
MBFL_ICHECK_ENV	+= testsdir=$(builddir)/tests; export testsdir;
MBFL_ICHECK_ENV	+= export MBFL_LIBRARY_PATH=$(DESTDIR)$(mmuxbashlibdir):$(MBFL_LIBRARY_PATH);
MBFL_ICHECK_ENV	+= export LD_LIBRARY_PATH=$(DESTDIR)$(libdir):$(LD_LIBRARY_PATH);
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

endif


#### common rules

include $(top_srcdir)/meta/automake/mmux-makefile-rules

### end of file
