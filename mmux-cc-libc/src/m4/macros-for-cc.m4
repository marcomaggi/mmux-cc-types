m4_divert(-1)m4_dnl
m4_dnl
m4_dnl Part of: MMUX CC Libc Macros
m4_dnl Contents: macros for code generation
m4_dnl Date: Dec  8, 2024
m4_dnl
m4_dnl Abstract
m4_dnl
m4_dnl		This library  defines macros to  generate C language code.
m4_dnl
m4_dnl Copyright (C) 2024 Marco Maggi <mrc.mgg@gmail.com>
m4_dnl
m4_dnl This program is free  software: you can redistribute it and/or  modify it under the
m4_dnl terms  of  the  GNU General  Public  License  as  published  by the  Free  Software
m4_dnl Foundation, either version 3 of the License, or (at your option) any later version.
m4_dnl
m4_dnl This program  is distributed in the  hope that it  will be useful, but  WITHOUT ANY
m4_dnl WARRANTY; without  even the implied  warranty of  MERCHANTABILITY or FITNESS  FOR A
m4_dnl PARTICULAR PURPOSE.  See the GNU General Public License for more details.
m4_dnl
m4_dnl You should have received  a copy of the GNU General Public  License along with this
m4_dnl program.  If not, see <http://www.gnu.org/licenses/>.
m4_dnl


m4_dnl preamble

m4_changequote(`[[[', `]]]')
m4_changecom([[[/*]]],[[[*/]]])


m4_dnl helpers

m4_define([[[MMUX_M4_TOUPPER]]],[[[m4_translit([[[$1]]],[[[abcdefghijklmnopqrstuvwxyz]]],[[[ABCDEFGHIJKLMNOPQRSTUVWXYZ]]])]]])
m4_define([[[MMUX_M4_TOLOWER]]],[[[m4_translit([[[$1]]],[[[ABCDEFGHIJKLMNOPQRSTUVWXYZ]]],[[[abcdefghijklmnopqrstuvwxyz]]])]]])


m4_dnl let's go

m4_dnl end of file
m4_dnl Local Variables:
m4_dnl mode: m4
m4_dnl End:
m4_divert(0)m4_dnl
