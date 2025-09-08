/*
  Part of: MMUX CC Types
  Contents: library functions
  Date: Aug 26, 2025

  Abstract

	This module implements library functions.

  Copyright (C) 2025 Marco Maggi <mrc.mgg@gmail.com>

  This program is free  software: you can redistribute it and/or  modify it under the
  terms  of  the  GNU General  Public  License  as  published  by the  Free  Software
  Foundation, either version 3 of the License, or (at your option) any later version.

  This program  is distributed in the  hope that it  will be useful, but  WITHOUT ANY
  WARRANTY; without  even the implied  warranty of  MERCHANTABILITY or FITNESS  FOR A
  PARTICULAR PURPOSE.  See the GNU General Public License for more details.

  You should have received  a copy of the GNU General Public  License along with this
  program.  If not, see <http://www.gnu.org/licenses/>.
*/


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <mmux-cc-types-internals.h>


/** --------------------------------------------------------------------
 ** Version functions.
 ** ----------------------------------------------------------------- */

char const *
mmux_cc_types_version_string (void)
{
  return (char const *)mmux_cc_types_VERSION_INTERFACE_STRING;
}
int
mmux_cc_types_version_interface_current (void)
{
  return mmux_cc_types_VERSION_INTERFACE_CURRENT;
}
int
mmux_cc_types_version_interface_revision (void)
{
  return mmux_cc_types_VERSION_INTERFACE_REVISION;
}
int
mmux_cc_types_version_interface_age (void)
{
  return mmux_cc_types_VERSION_INTERFACE_AGE;
}


/** --------------------------------------------------------------------
 ** Library initialisation.
 ** ----------------------------------------------------------------- */

bool
mmux_cc_types_init (void)
{
  if (mmux_cc_types_init_sprint_module())  { return true; }
  if (mmux_cc_types_init_parsers_module()) { return true; }
  return false;
}
void
mmux_cc_types_final (void)
{
  mmux_cc_types_final_sprint_module();
  mmux_cc_types_final_parsers_module();
}


/** --------------------------------------------------------------------
 ** Miscellaneous.
 ** ----------------------------------------------------------------- */

mmux_sint_t
mmux_ctype_generic_error (...)
/* This function is used in "mmux-cc-types-generics.h". */
{
  return mmux_sint_constant_zero();
}

/* end of file */
