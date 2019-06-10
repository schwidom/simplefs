
#include "stat.h"

#include "RList.h"
#include "NamedRList.h"

#include "createStatResult.h"

#include <iostream>
#include <functional>

extern "C" {
// int stat(const char *pathname, struct stat *buf);
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
}

extern "C" SEXP simplefs_stat(SEXP filenames)
{
 
 RList ret(length(filenames));

 for( int i= 0; i< length(filenames); i++)
 {
  SEXP filename = STRING_ELT(filenames, i);
  char const * c_filename = CHAR( filename);
  struct stat buf;
  int res = stat( c_filename, &buf);
  
  ret.append( createStatResult( buf, res, c_filename));
 }

 return ret.get();
}

