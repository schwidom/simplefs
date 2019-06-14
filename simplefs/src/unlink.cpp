
#include "unlink.h"

#include "RList.h"
#include "NamedRList.h"

#include <iostream>
#include <functional>

extern "C" {
// int unlink(const char *pathname);
#include <unistd.h>
#include <errno.h>
}

extern "C" SEXP simplefs_unlink(SEXP filenames)
{
 
 RList ret(length(filenames));

 for( int i= 0; i< length(filenames); i++)
 {
  SEXP filename = STRING_ELT(filenames, i);
  char const * c_filename = CHAR( filename);

  int res = unlink( c_filename);
  
  if( 0 != res) { res = errno; }

  int numberOfResultFields = 2;

  NamedRList namedRList( numberOfResultFields);

  namedRList.append( "filename", c_filename);
  namedRList.append( "returnValue", res);

  ret.append(namedRList.get());
 }

 return ret.get();
}

