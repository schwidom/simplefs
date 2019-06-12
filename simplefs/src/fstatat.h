#pragma once

#include <R.h>
#include <Rinternals.h>

extern "C" SEXP simplefs_get_AT_EMPTY_PATH();
extern "C" SEXP simplefs_get_AT_NO_AUTOMOUNT();
extern "C" SEXP simplefs_get_AT_SYMLINK_NOFOLLOW();

extern "C" SEXP simplefs_get_S_IFSOCK();
extern "C" SEXP simplefs_get_S_IFLNK();
extern "C" SEXP simplefs_get_S_IFREG();
extern "C" SEXP simplefs_get_S_IFBLK();
extern "C" SEXP simplefs_get_S_IFDIR();
extern "C" SEXP simplefs_get_S_IFCHR();
extern "C" SEXP simplefs_get_S_IFIFO();

extern "C" SEXP simplefs_fstatat(SEXP filename, SEXP flags);


