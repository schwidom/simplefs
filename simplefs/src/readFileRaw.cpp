
#include "readFileRaw.h"

#include "RList.h"
#include "NamedRList.h"

#include <iostream>
#include <functional>

extern "C" {
// int stat(const char *pathname, struct stat *buf);
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

// FILE *fopen(const char *path, const char *mode); // man 3 fopen
#include <stdio.h>

#include <errno.h>
}

extern "C" SEXP simplefs_readFileRaw(SEXP filenames)
{

 RList ret(length(filenames));

 for( int i= 0; i< length(filenames); i++)
 {
  SEXP filename = STRING_ELT(filenames, i);
  char const * c_filename = CHAR( filename);

  struct stat buf;

  int res = stat( c_filename, &buf);
  
  if( 0 != res) { res = errno; }

  SEXP fileContent = nullptr;

  if( 0 == res)
  {
   FILE * f;
   if( nullptr == ( f = fopen( c_filename, "rb")))
   {
    res = errno;
   }
   else
   {
    fileContent = PROTECT( allocVector( RAWSXP, buf.st_size));

    int readLen = fread( RAW(fileContent), 1, buf.st_size, f);

    if( readLen != buf.st_size)
    {
     res = 100815;
     UNPROTECT( 1); // fileContent
    }

    fclose( f);
   }
  }

  int numberOfResultFields = 2;

  if( 0==res) {
   ++numberOfResultFields;
  }
 
  NamedRList namedRList( numberOfResultFields);

  if( 0 != res)
  {
   namedRList.append( "filename", c_filename);
   namedRList.append( "returnValue", res);
  }
  else
  {
   namedRList.append( "filename", c_filename);
   namedRList.append( "returnValue", res);
   namedRList.append( "result", fileContent);
   UNPROTECT( 1); // fileContent
  }

  ret.append(namedRList.get());
 }

 return ret.get();
}

