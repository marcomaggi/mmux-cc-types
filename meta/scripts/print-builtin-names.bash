#!/bin/bash
#
# Part of: MMUX Bash Pointers
# Contents: core library
# Date: Oct 12, 2024
#
# Abstract
#
#	Run this script to output a list of builtin names.
#
# Copyright (C) 2024 Marco Maggi <mrc.mgg@gmail.com>
#
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU
# General Public  License as  published by  the Free Software  Foundation, either  version 3  of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that  it will be useful, but WITHOUT ANY WARRANTY; without
# even the  implied warranty of MERCHANTABILITY  or FITNESS FOR  A PARTICULAR PURPOSE.  See  the GNU
# General Public License for more details.
#
# You should  have received a copy  of the GNU General  Public License along with  this program.  If
# not, see <http://www.gnu.org/licenses/>.
#

declare -ra SIGNED_INTEGER_STEMS=(schar sshort sint slong sllong
				  sint8 sint16 sint32 sint64 ssize
				  sintmax sintptr ptrdiff off uid gid wchar time)
declare -ra UNSIGNED_INTEGER_STEMS=(uchar ushort uint ulong ullong
				    uint8 uint16 uint32 uint64 usize
				    uintmax uintptr mode pid wint socklen rlim)
declare -ra INTEGER_STEMS=("${SIGNED_INTEGER_STEMS[@]}" "${UNSIGNED_INTEGER_STEMS[@]}")

declare -ra REAL_FLOAT_STEMS=(float double ldouble
			      float32 float64 float128
			      float32x float64x float128x
			      decimal32 decimal64 decimal128)
declare -ra COMPLEX_FLOAT_STEMS=(complexf complexd complexld
				 complexf32 complexf64 complexf128
				 complexf32x complexf64x complexf128x
				 complexd32 complexd64 complexd128)
declare -ra FLOAT_STEMS=("${REAL_FLOAT_STEMS[@]}" "${COMPLEX_FLOAT_STEMS[@]}")

declare -ga MMUX_BASH_POINTERS_REAL_STEMS=('pointer' "${INTEGER_STEMS[@]}" "${REAL_FLOAT_STEMS[@]}")
declare -ga MMUX_BASH_POINTERS_COMPLEX_STEMS=("${COMPLEX_FLOAT_STEMS[@]}")
declare -ga MMUX_BASH_POINTERS_STEMS=("${MMUX_BASH_POINTERS_REAL_STEMS[@]}" "${MMUX_BASH_POINTERS_COMPLEX_STEMS[@]}")

declare -ra LIBC_BUILTINS=(malloc realloc calloc free
			   memset memzero memcpy mempcpy memccpy memmove memcmp memchr memrchr memcpy_from_bash_string
			   memmem rawmemchr
			   strerror errno_to_string
			   open openat close read write pread pwrite lseek dup dup2 dup3 fcntl ioctl pipe
			   fd_set_calloc fd_set_calloc_triplet FD_ZERO FD_SET FD_CLR FD_ISSET select
			   iovec_calloc iovec_array_calloc iov_base_ref iov_base_set iov_len_ref iov_len_set iovec_dump
			   readv writev preadv pwritev preadv2 pwritev2 copy_file_range
			   flock_calloc flock_dump l_type_set l_type_ref l_whence_set l_whence_ref
			   l_start_set l_start_ref l_len_set l_len_ref l_pid_set l_pid_ref
			   strlen strcpy strncpy strdup stpcpy strcat strncat strcmp strncmp strcoll strxfrm
			   strchr strrchr strstr strcasestr strspn strcspn strpbrk strtok
			   link linkat symlink readlink readlinkat realpath canonicalize_file_name
			   unlink unlinkat remove rmdir rename renameat renameat2
			   mkdir mkdirat
			   chown fchown lchown fchownat umask getumask chmod fchmod fchmodat access faccessat
			   truncate ftruncate stat fstat lstat fstatat stat_calloc stat_dump
			   st_mode_ref st_mode_set
			   st_ino_ref st_ino_set
			   st_dev_ref st_dev_set
			   st_nlink_ref st_nlink_set
			   st_uid_ref st_uid_set
			   st_gid_ref st_gid_set
			   st_size_ref st_size_set
			   st_atime_sec_ref st_atime_sec_set
			   st_atime_nsec_ref st_atime_nsec_set
			   st_mtime_sec_ref st_mtime_sec_set
			   st_mtime_nsec_ref st_mtime_nsec_set
			   st_ctime_sec_ref st_ctime_sec_set
			   st_ctime_nsec_ref st_ctime_nsec_set
			   st_blocks_ref st_blocks_set
			   st_blksize_ref st_blksize_set
			   S_ISDIR S_ISCHR S_ISBLK S_ISREG S_ISFIFO S_ISLNK S_ISSOCK S_TYPEISMQ S_TYPEISSEM S_TYPEISSHM
			   utimbuf_calloc utimbuf_dump actime_set actime_ref modtime_set modtime_ref
			   utime utimes futimes lutimes
			   getuid getgid geteuid getegid getgroups getgrouplist getlogin
			   getpwuid getpwnam setpwent getpwent endpwent
			   pw_name_ref pw_passwd_ref pw_uid_ref pw_gid_ref pw_gecos_ref pw_dir_ref pw_shell_ref passwd_dump
			   getgrgid getgrnam setgrent getgrent endgrent group_member
			   gr_name_ref gr_gid_ref gr_mem_ref group_dump
			   timeval_calloc timeval_set timeval_ref tv_sec_set tv_sec_ref tv_usec_set tv_usec_ref timeval_dump
			   timespec_calloc timespec_set timespec_ref ts_sec_set ts_sec_ref ts_nsec_set ts_nsec_ref timespec_dump
			   tm_calloc tm_sec_set tm_sec_ref tm_min_set tm_min_ref tm_hour_set tm_hour_ref
			   tm_mday_set tm_mday_ref tm_mon_set tm_mon_ref tm_year_set tm_year_ref
			   tm_wday_set tm_wday_ref tm_yday_set tm_yday_ref tm_isdst_set tm_isdst_ref
			   tm_gmtoff_set tm_gmtoff_ref tm_reset tm_dump
			   time localtime gmtime mktime timegm asctime ctime strftime strptime sleep nanosleep
			   islower isupper isalpha isdigit isalnum isxdigit ispunct isspace isblank isgraph isprint
			   iscntrl isascii tolower toupper
			   sa_family_ref sockaddr_dump
			   sockaddr_un_calloc sun_family_ref sun_path_ref sockaddr_un_dump
			   sockaddr_in_calloc sockaddr_in_dump
			   sin_family_ref sin_family_set sin_addr_ref sin_addr_set sin_addr_pointer_ref sin_port_ref sin_port_set
			   sockaddr_insix_calloc sockaddr_insix_dump
			   sinsix_family_ref sinsix_family_set sinsix_addr_pointer_ref sinsix_flowinfo_ref sinsix_flowinfo_set
			   sinsix_scope_id_ref sinsix_scope_id_set sinsix_port_ref sinsix_port_set
			   addrinfo_calloc ai_flags_ref ai_flags_set ai_family_ref ai_family_set ai_socktype_ref ai_socktype_set
			   addrinfo_dump
			   ai_protocol_ref ai_protocol_set ai_addrlen_ref ai_addrlen_set ai_addr_ref ai_addr_set
			   ai_canonname_ref ai_canonname_set ai_next_ref ai_next_set
			   hostent_calloc h_name_ref h_name_set h_aliases_ref h_aliases_set h_addrtype_ref h_addrtype_set
			   h_length_ref h_length_set h_addr_list_ref h_addr_list_set h_addr_ref h_addr_set hostent_dump
			   sethostent gethostent endhostent
			   servent_calloc s_name_ref s_name_set s_aliases_ref s_aliases_set
			   s_port_ref s_port_set s_proto_ref s_proto_set servent_dump
			   setservent getservent endservent getservbyname getservbyport
			   protoent_calloc p_name_ref p_aliases_ref p_proto_ref protoent_dump
			   setprotoent getprotoent endprotoent getprotobyname getprotobynumber
			   netent_calloc n_name_ref n_name_set n_aliases_ref n_aliases_set
			   n_addrtype_ref n_addrtype_set n_net_ref n_net_set netent_dump
			   setnetent getnetent endnetent getnetbyname getnetbyaddr
			   htons ntohs htonl ntohl inet_aton inet_addr inet_ntoa inet_network inet_makeaddr
			   inet_lnaof inet_netof inet_pton inet_ntop
			   if_nametoindex if_indextoname if_nameindex_to_array
			   getaddrinfo freeaddrinfo getnameinfo
			   bind getsockname socket shutdown socketpair connect listen accept accept4 getpeername
			   send recv sendto recvfrom getsockopt setsockopt
			   getpid getppid gettid
			   sysconf confstr pathconf fpathconf setrlimit getrlimit prlimit
			   rlimit_calloc rlimit_dump rlim_cur_set rlim_cur_ref rlim_max_set rlim_max_ref
			   strnlen strndup stpncpy strcasecmp strncasecmp strverscmp strchrnul basename dirname)

declare -ra MATH_REAL_BUILTINS=(sin cos tan asin acos atan atan2
				sinh cosh tanh asinh acosh atanh
				exp exp2 exp10 log log10 log2 logb
				pow sqrt cbrt hypot expm1 log1p
				erf erfc lgamma tgamma j0 j1 jn y0 y1 yn)

declare -ra MATH_COMPLEX_BUILTINS=(sin cos tan asin acos atan
				   sinh cosh tanh asinh acosh atanh
				   exp log log10 pow sqrt)

### ------------------------------------------------------------------------

declare -i IDX=

function print_builtin_name () {
    declare NAME=${1:?"missing parameter 1 name of bulitin in call to '$FUNCNAME'"}

    printf 'MMUX_BASH_POINTERS_PACKAGE[BUILTIN_%d]=%s\n' ${IDX:?} "${NAME:?}"
    let ++IDX
}

print_builtin_name 'mmux_bash_pointers_library_init'


declare -i IDX JDX
declare NAME ALIAS ITEM STEM

# Standard C Library stuff.
{
    for ITEM in "${LIBC_BUILTINS[@]}"
    do
	printf -v NAME 'mmux_libc_%s' "$ITEM"
	print_builtin_name "$NAME"
    done
}

# Conversions.
{
    for NAME in mmux_pointer_from_bash_string mmux_pointer_to_bash_string mmux_schar_from_string mmux_schar_to_string
    do print_builtin_name "$NAME"
    done
}

for STEM in "${MMUX_BASH_POINTERS_STEMS[@]}"
do
    printf -v NAME 'mmux_%s_pointer_set' "$STEM"
    print_builtin_name "$NAME"

    printf -v NAME 'mmux_%s_array_set'   "$STEM"
    print_builtin_name "$NAME"

    printf -v NAME 'mmux_%s_pointer_ref' "$STEM"
    print_builtin_name "$NAME"

    printf -v NAME 'mmux_%s_array_ref' "$STEM"
    print_builtin_name "$NAME"
done

# Arithmetics builtins.
{
    print_builtin_name 'mmux_pointer_add'
    print_builtin_name 'mmux_pointer_diff'

    for STEM in "${INTEGER_STEMS[@]}"
    do
	for ITEM in add sub mul div mod neg inv incr decr abs
	do
	    printf -v NAME  'mmux_%s_%s' "$STEM" "$ITEM"
	    print_builtin_name "$NAME"
	done
    done

    for STEM in "${REAL_FLOAT_STEMS[@]}"
    do
	for ITEM in add sub mul div neg inv abs
	do
	    printf -v NAME 'mmux_%s_%s' "$STEM" "$ITEM"
	    print_builtin_name "$NAME"
	done
    done

    for STEM in "${COMPLEX_FLOAT_STEMS[@]}"
    do
	for ITEM in add sub mul div neg inv abs make_rectangular real_part imag_part arg conj
	do
	    printf -v NAME 'mmux_%s_%s' "$STEM" "$ITEM"
	    print_builtin_name "$NAME"
	done
    done
}

# Bitwise builtins.
{
    for STEM in 'pointer' "${INTEGER_STEMS[@]}"
    do
	for ITEM in and or xor not shl shr
	do
	    printf -v NAME 'mmux_%s_bitwise_%s' "$STEM" "$ITEM"
	    print_builtin_name "$NAME"
	done
    done
}

# Predicates builtins.
{
    for STEM in "${MMUX_BASH_POINTERS_STEMS[@]}"
    do
	printf -v NAME 'mmux_string_is_%s' "$STEM"
	print_builtin_name "$NAME"
    done

    for STEM in 'pointer' "${INTEGER_STEMS[@]}" "${REAL_FLOAT_STEMS[@]}"
    do
	for ITEM in zero positive negative non_positive non_negative nan infinite
	do
	    printf -v NAME  'mmux_%s_is_%s' "$STEM" "$ITEM"
	    print_builtin_name "$NAME"
	done
    done

    for STEM in "${COMPLEX_FLOAT_STEMS[@]}"
    do
	for ITEM in zero nan infinite
	do
	    printf -v NAME 'mmux_%s_is_%s' "$STEM" "$ITEM"
	    print_builtin_name "$NAME"
	done
    done
}

# Comparison builtins.
{
    for STEM in 'pointer' "${INTEGER_STEMS[@]}"
    do
	for ITEM in equal greater less greater_equal less_equal min max
	do
	    printf -v NAME  'mmux_%s_%s' "$STEM" "$ITEM"
	    print_builtin_name "$NAME"
	done
    done

    for STEM in "${REAL_FLOAT_STEMS[@]}"
    do
	for ITEM in equal greater less greater_equal less_equal equal_absmargin equal_relepsilon min max
	do
	    printf -v NAME  'mmux_%s_%s' "$STEM" "$ITEM"
	    print_builtin_name "$NAME"
	done
    done

    for STEM in "${COMPLEX_FLOAT_STEMS[@]}"
    do
	for ITEM in equal equal_absmargin equal_relepsilon
	do
	    printf -v NAME  'mmux_%s_%s' "$STEM" "$ITEM"
	    print_builtin_name "$NAME"
	done
    done
}

# Output format selection.
{
    for STEM in "${REAL_FLOAT_STEMS[@]}"
    do
	for ITEM in set_format ref_format reformat
	do
	    printf -v NAME 'mmux_%s_%s' "$STEM" "$ITEM"
	    print_builtin_name "$NAME"
	done
    done

    for STEM in "${COMPLEX_FLOAT_STEMS[@]}"
    do
	for ITEM in reformat
	do
	    printf -v NAME 'mmux_%s_%s' "$STEM" "$ITEM"
	    print_builtin_name "$NAME"
	done
    done
}

# Mathematics builtins.
{
    for STEM in "${REAL_FLOAT_STEMS[@]}"
    do
	for ITEM in "${MATH_REAL_BUILTINS[@]}"
	do
	    printf -v NAME 'mmux_%s_%s' "$STEM" "$ITEM"
	    print_builtin_name "$NAME"
	done
    done

    for STEM in "${COMPLEX_FLOAT_STEMS[@]}"
    do
	for ITEM in "${MATH_COMPLEX_BUILTINS[@]}"
	do
	    printf -v NAME 'mmux_%s_%s' "$STEM" "$ITEM"
	    print_builtin_name "$NAME"
	done
    done

    for STEM in "${REAL_FLOAT_STEMS[@]}"
    do
	for ITEM in E LOG2E LOG10E LN2 LN10 PI PI_2 PI_4 1_PI 2_PI 2_SQRTPI SQRT2 SQRT1_2
	do
	    printf -v NAME 'mmux_%s_constant_%s' "$STEM" "$ITEM"
	    print_builtin_name "$NAME"
	done
    done
}

### ------------------------------------------------------------------------

# The environment variable "CONFIG_H_FILE" is exported by the makefile.
#
function have_cfunc () {
    declare -r CFUNCNAME=${1:?}
    declare -r UPCASE_CFUNCNAME=${CFUNCNAME^^}
    declare -r SYMBOL_TEMPLATE='HAVE_%s'
    declare -r RESULT_TEMPLATE='#define HAVE_%s 1'
    declare SYMBOL RESULT LINE

    printf -v SYMBOL "$SYMBOL_TEMPLATE" "${UPCASE_CFUNCNAME}"
    printf -v RESULT "$RESULT_TEMPLATE" "${UPCASE_CFUNCNAME}"

    LINE=$(grep "$SYMBOL" "$CONFIG_H_FILE" )
    if test "$LINE" = "$RESULT"
    then return 0
    else return 1
    fi
}

# Builtin wrapping C language functions that may not be available.
# {
#     for ITEM in
#     do
# 	if have_cfunc "$ITEM"
# 	then
# 	    printf '%s: present: %s\n' "$0" "$ITEM" >&2
# 	    printf -v NAME 'mmux_libc_%s' "$ITEM"
# 	    print_builtin_name "$NAME"
# 	else printf '%s: missing: %s\n' "$0" "$ITEM" >&2
# 	fi
#     done
# }

### end of file
# Local Variables:
# mode: sh
# End:
