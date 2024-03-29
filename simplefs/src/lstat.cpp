
#include "lstat.h"

#include "RList.h"
#include "NamedRList.h"

#include "createStatResult.h"

#include <iostream>
#include <functional>

extern "C" {
// int lstat(const char *pathname, struct stat *buf);
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <errno.h>
}

extern "C" SEXP simplefs_lstat(SEXP filenames)
{
 
 RList ret(length(filenames));

 for( int i= 0; i< length(filenames); i++)
 {
  SEXP filename = STRING_ELT(filenames, i);
  char const * c_filename = CHAR( filename);
  struct stat buf;
  int res = lstat( c_filename, &buf);
  
  if( 0 != res) { res = errno; }

  ret.append( createStatResult( buf, res, c_filename));
 }

 return ret.get();
}

