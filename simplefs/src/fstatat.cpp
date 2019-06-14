
#include "fstatat.h"

#include "RList.h"
#include "NamedRList.h"

#include "createStatResult.h"

#include <iostream>
#include <functional>

extern "C" {
// int fstatat(const char *pathname, struct fstatat *buf);
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>           /* Definition of AT_* constants */
#include <errno.h>
}

extern "C" SEXP simplefs_get_AT_EMPTY_PATH() { SEXP ret = PROTECT( allocVector( INTSXP, 1)); INTEGER(ret)[0] = AT_EMPTY_PATH; UNPROTECT( 1); return ret;}
extern "C" SEXP simplefs_get_AT_NO_AUTOMOUNT() { SEXP ret = PROTECT( allocVector( INTSXP, 1)); INTEGER(ret)[0] = AT_NO_AUTOMOUNT; UNPROTECT( 1); return ret;}
extern "C" SEXP simplefs_get_AT_SYMLINK_NOFOLLOW() { SEXP ret = PROTECT( allocVector( INTSXP, 1)); INTEGER(ret)[0] = AT_SYMLINK_NOFOLLOW; UNPROTECT( 1); return ret;}

extern "C" SEXP simplefs_get_S_IFSOCK() { SEXP ret = PROTECT( allocVector( INTSXP, 1)); INTEGER(ret)[0] = S_IFSOCK; UNPROTECT( 1); return ret;}
extern "C" SEXP simplefs_get_S_IFLNK() { SEXP ret = PROTECT( allocVector( INTSXP, 1)); INTEGER(ret)[0] = S_IFLNK; UNPROTECT( 1); return ret;}
extern "C" SEXP simplefs_get_S_IFREG() { SEXP ret = PROTECT( allocVector( INTSXP, 1)); INTEGER(ret)[0] = S_IFREG; UNPROTECT( 1); return ret;}
extern "C" SEXP simplefs_get_S_IFBLK() { SEXP ret = PROTECT( allocVector( INTSXP, 1)); INTEGER(ret)[0] = S_IFBLK; UNPROTECT( 1); return ret;}
extern "C" SEXP simplefs_get_S_IFDIR() { SEXP ret = PROTECT( allocVector( INTSXP, 1)); INTEGER(ret)[0] = S_IFDIR; UNPROTECT( 1); return ret;}
extern "C" SEXP simplefs_get_S_IFCHR() { SEXP ret = PROTECT( allocVector( INTSXP, 1)); INTEGER(ret)[0] = S_IFCHR; UNPROTECT( 1); return ret;}
extern "C" SEXP simplefs_get_S_IFIFO() { SEXP ret = PROTECT( allocVector( INTSXP, 1)); INTEGER(ret)[0] = S_IFIFO; UNPROTECT( 1); return ret;}

extern "C" SEXP simplefs_fstatat(SEXP filenames, SEXP flags)
{
 
 RList ret(length(filenames));

 for( int i= 0; i< length(filenames); i++)
 {
  SEXP filename = STRING_ELT(filenames, i);
  char const * c_filename = CHAR( filename);
  struct stat buf;

  // AT_EMPTY_PATH, AT_NO_AUTOMOUNT, AT_SYMLINK_NOFOLLOW
  int c_flags = INTEGER(flags)[0]; // TODO : ensure check of element count

  int res = fstatat( AT_FDCWD, c_filename, &buf, c_flags);
  
  if( 0 != res) { res = errno; }

  ret.append( createStatResult( buf, res, c_filename));
 }

 return ret.get();
}

