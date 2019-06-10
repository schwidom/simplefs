
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
}

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
  
  ret.append( createStatResult( buf, res, c_filename));
 }

 return ret.get();
}

