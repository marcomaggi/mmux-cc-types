/*
  Part of: MMUX CC Types
  Contents: public header file
  Date: Mar 27, 2026

  Abstract

	This is module implements the type conversion functions.  This header file is
	included by the main header "mmux-cc-types.h"  and it must not be included by
	itself.

  Copyright (C) 2026 Marco Maggi <mrc.mgg@gmail.com>

  This program is free  software: you can redistribute it and/or  modify it under the
  terms  of  the  GNU General  Public  License  as  published  by the  Free  Software
  Foundation, either version 3 of the License, or (at your option) any later version.

  This program  is distributed in the  hope that it  will be useful, but  WITHOUT ANY
  WARRANTY; without  even the implied  warranty of  MERCHANTABILITY or FITNESS  FOR A
  PARTICULAR PURPOSE.  See the GNU General Public License for more details.

  You should have received  a copy of the GNU General Public  License along with this
  program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef MMUX_CC_TYPES_CONVERSION_H
#define MMUX_CC_TYPES_CONVERSION_H 1


/** --------------------------------------------------------------------
 ** Conversions: integers.
 ** ----------------------------------------------------------------- */

mmux_cc_types_inline_decl bool
mmux_ptrdiff_from_usize (mmux_ptrdiff_t * ouput_p, mmux_usize_t input)
{
  register auto	in = mmux_uintmax(input.value);
  register auto	pd = mmux_uintmax(mmux_ptrdiff_constant_maximum().value);

  if (mmux_ctype_less(pd, in)) {
    return true;
  } else {
    *ouput_p = mmux_ptrdiff(input.value);
    return false;
  }
}


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* defined MMUX_CC_TYPES_CONVERSION_H */

/* end of file */
