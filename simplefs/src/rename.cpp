
#include "stat.h"

#include "RList.h"
#include "NamedRList.h"

#include <iostream>
#include <functional>

extern "C" {
// int rename(const char *oldpath, const char *newpath);
#include <stdio.h>
#include <errno.h>
}

extern "C" SEXP simplefs_rename(SEXP filenamesFrom, SEXP filenamesTo)
{

 if( length(filenamesFrom) != length(filenamesTo))
 {
  error_return( "length of filenamesFrom differs from filenamesTo");
 }

 int element_count = length(filenamesFrom);

 RList ret(element_count);

 for( int i= 0; i< element_count; i++)
 {
  SEXP filenameFrom = STRING_ELT(filenamesFrom, i);
  SEXP filenameTo = STRING_ELT(filenamesTo, i);

  char const * c_filenameFrom = CHAR( filenameFrom);
  char const * c_filenameTo = CHAR( filenameTo);

  int res = rename( c_filenameFrom, c_filenameTo);

  if( 0 != res) { res = errno; }

  int numberOfResultFields = 3;

  NamedRList namedRList( numberOfResultFields);

  namedRList.append( "filenameFrom", c_filenameFrom);
  namedRList.append( "filenameTo", c_filenameTo);
  namedRList.append( "returnValue", res);

  ret.append(namedRList.get());

 }

 return ret.get();
}

