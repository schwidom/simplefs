
#include "touch.h"

#include "RList.h"
#include "NamedRList.h"

#include <iostream>
#include <functional>

extern "C" {
// FILE *fopen(const char *path, const char *mode); // man 3 fopen
// int fclose(FILE *fp); // man 3 fclose
// mode:
//  a      Open for appending (writing at end of file).  The file is created if it  does
//         not exist.  The stream is positioned at the end of the file.

#include <stdio.h>
#include <errno.h>
}

extern "C" SEXP simplefs_touch(SEXP filenames)
{
 
 RList ret(length(filenames));

 for( int i= 0; i< length(filenames); i++)
 {
  SEXP filename = STRING_ELT(filenames, i);
  char const * c_filename = CHAR( filename);

  int res = 0;

  {
   FILE * f = fopen( c_filename, "a+b");
   bool failed = false;

   if( ! f) {
    failed = true;
   }
   else
   {
    failed = ( 0 != fclose(f));
   }

   if( failed)
   {
    res = errno;
   }
  }

  int numberOfResultFields = 2;

  NamedRList namedRList( numberOfResultFields);

  namedRList.append( "filename", c_filename);
  namedRList.append( "returnValue", res);

  ret.append(namedRList.get());
 }

 return ret.get();
}

