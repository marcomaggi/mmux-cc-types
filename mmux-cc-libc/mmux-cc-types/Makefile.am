## Process this file with automake to produce Makefile.in

ACLOCAL_AMFLAGS		= -I meta/autotools
AUTOMAKE_OPTIONS	= foreign
EXTRA_DIST		= INSTALL
dist_doc_DATA		= README COPYING
AM_CFLAGS		= $(MMUX_CFLAGS)
AM_CPPFLAGS		= -I$(srcdir)/src/ -I$(builddir)/src/
CLEANFILES		=
DISTCLEANFILES		=
BUILT_SOURCES		=

## --------------------------------------------------------------------

nodist_pkgconfig_DATA	= meta/scripts/mmux-cc-types.pc


#### GNU m4 macros

EXTRA_DIST		+= \
	$(top_srcdir)/src/m4/macros-for-cc.m4	\
	$(top_srcdir)/src/m4/mmux-cc-types-config.m4.in

MMUX_M4_FLAGS		=  $(M4FLAGS) --prefix-builtins --include=$(srcdir)/src/m4/
MMUX_M4_FLAGS		+= --include=$(builddir)/src/ --include=$(builddir)/src/m4

# These  are  used  to  preprocess C  language  files  with  extension
# ".c.m4".  Do not change the order of inclusion!!!
#
MMUX_M4_CC_MACROS	= \
	$(top_srcdir)/src/m4/macros-for-cc.m4	\
	$(builddir)/src/m4/mmux-cc-types-config.m4


#### Automake dirstamp files

MMUX_AM_DIRSTAMP_FILES	=src/m4/$(am__dirstamp)

BUILT_SOURCES		+= $(MMUX_AM_DIRSTAMP_FILES)
DISTCLEANFILES		+= $(MMUX_AM_DIRSTAMP_FILES)

src/m4/$(am__dirstamp):
	@$(MKDIR_P) src/m4/
	@: > $(@)


#### support for GNU Emacs

if WANT_EMACS
sharelispdir		= $(datadir)/emacs/site-lisp
dist_sharelisp_LISP	= src/emacs/mmux-cc-types.el
endif


#### documentation

AM_MAKEINFOFLAGS	= --no-split
AM_MAKEINFOHTMLFLAGS	= --split=node -c WORDS_IN_PAGE=0 --css-ref=mmux-bash-pointers.css \
	-c PRE_BODY_CLOSE="<p>This document describes version <tt>$(PACKAGE_VERSION)</tt> of <em>$(PACKAGE_NAME)</em>.</p>"

info_TEXINFOS		= doc/mmux-cc-types.texi
EXTRA_DIST		+= doc/mmux-cc-types.style.css
CLEANFILES		+= doc/mmux-cc-types.css

doc_mmux_cc_types_TEXINFOS	= \
	doc/macros.texi			\
	doc/overview-linking.texi	\
	doc/mmux-version.texi		\
	doc/gpl-3.0.texi		\
	doc/fdl-1.3.texi

## --------------------------------------------------------------------

doc/mmux-cc-types.html/$(am__dirstamp): doc/$(am__dirstamp)
	@$(MKDIR_P) doc/mmux-cc-types.html/
	@: > doc/mmux-cc-types.html/$(am__dirstamp)

doc/mmux-cc-types.html/mmux-cc-types.css: \
	doc/mmux-cc-types.style.css doc/mmux-cc-types.html/$(am__dirstamp)
	$(INSTALL) -m 0444 "$(top_srcdir)/doc/mmux-cc-types.style.css" "$(builddir)/doc/mmux-cc-types.html/mmux-cc-types.css"

## --------------------------------------------------------------------

html-local: doc/mmux-cc-types.html/mmux-cc-types.css

install-html-local:
	$(MKDIR_P) "$(DESTDIR)$(htmldir)/mmux-cc-types.html/"
	$(INSTALL) -m 0444 $(builddir)/doc/mmux-cc-types.html/mmux-cc-types.css "$(DESTDIR)$(htmldir)/mmux-cc-types.html/"


#### support library for _DecimalN
#
# This support  library exists because  "libdfp" is a crazy  beast: it
# defines  header files  with the  same filenames  of the  stancdard C
# header files, then tries to load them all.
#
# The command line  options needed to do this can  mess with the other
# code.  So everything "libdfp" is confined into this support library.
#
# Also  we really  want  to compile  this code  (and  only this  code)
# without the "-pedantic" flag.
#

EXTRA_DIST	+= src/mmux-cc-types-libdfp.c.m4

if WANT_LIBDFP
MMUX_CC_TYPES_LIBDFP_BUILT_SOURCES	= src/mmux-cc-types-libdfp.c

BUILT_SOURCES	+= $(MMUX_CC_TYPES_LIBDFP_BUILT_SOURCES)
CLEANFILES	+= $(MMUX_CC_TYPES_LIBDFP_BUILT_SOURCES)
DISTCLEANFILES	+= $(MMUX_CC_TYPES_LIBDFP_BUILT_SOURCES)

noinst_LTLIBRARIES			= libmmux-cc-types-libdfp.la
libmmux_cc_types_libdfp_la_CPPFLAGS	= $(AM_CPPFLAGS)
libmmux_cc_types_libdfp_la_CFLAGS	= $(AM_CFLAGS)  $(LIBDFP_CFLAGS) -Wno-pedantic
libmmux_cc_types_libdfp_la_LDFLAGS	= $(AM_LDFLAGS) $(LIBDFP_LIBS)
libmmux_cc_types_libdfp_la_SOURCES	= src/mmux-cc-types-libdfp.c
endif


#### libraries

EXTRA_DIST	+= \
	src/mmux-cc-types.h.m4				\
	src/mmux-cc-types-internals.h.m4		\
	src/mmux-cc-types-constants.c.m4		\
	src/mmux-cc-types-core.c.m4			\
	src/mmux-cc-types-parsers.c.m4			\
	src/mmux-cc-types-sprinters.c.m4

MMUX_CC_TYPES_BUILT_SOURCES	= \
	src/mmux-cc-types.h				\
	src/mmux-cc-types-internals.h			\
	src/mmux-cc-types-constants.c			\
	src/mmux-cc-types-core.c			\
	src/mmux-cc-types-parsers.c			\
	src/mmux-cc-types-sprinters.c

BUILT_SOURCES	+= $(MMUX_CC_TYPES_BUILT_SOURCES)
CLEANFILES	+= $(MMUX_CC_TYPES_BUILT_SOURCES)
DISTCLEANFILES	+= $(MMUX_CC_TYPES_BUILT_SOURCES)

mmux_cc_types_CURRENT		= @mmux_cc_types_VERSION_INTERFACE_CURRENT@
mmux_cc_types_REVISION		= @mmux_cc_types_VERSION_INTERFACE_REVISION@
mmux_cc_types_AGE		= @mmux_cc_types_VERSION_INTERFACE_AGE@
mmux_cc_types_LINKER_VERSION	= -version-info $(mmux_cc_types_CURRENT):$(mmux_cc_types_REVISION):$(mmux_cc_types_AGE)

include_HEADERS				= \
	src/mmux-cc-types.h				\
	src/mmux-cc-types-config.h

lib_LTLIBRARIES			= libmmux-cc-types.la
libmmux_cc_types_la_CPPFLAGS	= $(AM_CPPFLAGS) -I$(builddir)/src
libmmux_cc_types_la_CFLAGS	= $(AM_CFLAGS) $(BASH_CFLAGS)
libmmux_cc_types_la_LDFLAGS	= $(mmux_cc_types_LINKER_VERSION) $(AM_LDFLAGS)
if WANT_LIBDFP
libmmux_cc_types_la_LIBADD	= libmmux-cc-types-libdfp.la
endif
libmmux_cc_types_la_SOURCES	= \
	src/mmux-cc-types.h				\
	src/mmux-cc-types-config.h			\
	src/mmux-cc-types-internals.h			\
	src/mmux-cc-types-constants.c			\
	src/mmux-cc-types-core.c			\
	src/mmux-cc-types-parsers.c			\
	src/mmux-cc-types-sprinters.c

.PHONY: library

library: libmmux-cc-types.la

src/%.h: src/%.h.m4 $(MMUX_M4_CC_MACROS)
	$(M4_PROGRAM) $(MMUX_M4_FLAGS) $(MMUX_M4_CC_MACROS) $< >$@

src/%.c: src/%.c.m4 $(MMUX_M4_CC_MACROS)
	$(M4_PROGRAM) $(MMUX_M4_FLAGS) $(MMUX_M4_CC_MACROS) $< >$@

src/%.$(OBJEXT): \
	src/mmux-cc-types.h			\
	src/mmux-cc-types-internals.h		\
	src/mmux-cc-types-config.h


#### TESTS

check_PROGRAMS	= \
	tests/version

TESTS				= $(check_PROGRAMS)

mmux_cc_types_tests_cppflags	= $(AM_CPPFLAGS) -I$(srcdir)/tests
mmux_cc_types_tests_ldadd	= $(AM_LDFLAGS) libmmux-cc-types.la

## ------------------------------------------------------------------------

tests_version_CPPFLAGS		= $(mmux_cc_types_tests_cppflags)
tests_version_LDADD		= $(mmux_cc_types_tests_ldadd)


#### interface to "make installcheck"

installcheck-local: $(TESTS)
	@RV=0							;\
	for FILE in $(TESTS)					;\
	do echo "running: '$(builddir)/$$FILE'"			;\
	    if ! "$(builddir)/$$FILE"				;\
	    then RV=$$?; break					;\
	    fi							;\
	done							;\
	if test "$$RV" = 77; then exit 0; else exit $$RV; fi	;


#### common rules

include $(top_srcdir)/meta/automake/mmux-makefile-rules

### end of file
