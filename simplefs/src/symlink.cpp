
#include "stat.h"

#include "RList.h"
#include "NamedRList.h"

#include <iostream>
#include <functional>

extern "C" {
// int symlink(const char *target, const char *linkpath);
#include <unistd.h>
#include <errno.h>
}

extern "C" SEXP simplefs_symlink(SEXP filenamesTarget, SEXP filenamesLinkPath)
{

 if( length(filenamesTarget) != length(filenamesLinkPath))
 {
  error_return( "length of filenamesTarget differs from filenamesLinkPath");
 }

 int element_count = length(filenamesTarget);

 RList ret(element_count);

 for( int i= 0; i< element_count; i++)
 {
  SEXP filenameTarget = STRING_ELT(filenamesTarget, i);
  SEXP filenameLinkPath = STRING_ELT(filenamesLinkPath, i);

  char const * c_filenameTarget = CHAR( filenameTarget);
  char const * c_filenameLinkPath = CHAR( filenameLinkPath);

  int res = symlink( c_filenameTarget, c_filenameLinkPath);

  if( 0 != res) { res = errno; }

  int numberOfResultFields = 3;

  NamedRList namedRList( numberOfResultFields);

  namedRList.append( "filenameTarget", c_filenameTarget);
  namedRList.append( "filenameLinkPath", c_filenameLinkPath);
  namedRList.append( "returnValue", res);

  ret.append(namedRList.get());

 }

 return ret.get();
}

