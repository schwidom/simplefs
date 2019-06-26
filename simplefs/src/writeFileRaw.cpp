
#include "writeFileRaw.h"

#include "RList.h"
#include "NamedRList.h"

#include <iostream>
#include <functional>

extern "C" {
// FILE *fopen(const char *path, const char *mode); // man 3 fopen
#include <stdio.h>

#include <errno.h>
}

extern "C" SEXP simplefs_writeFileRaw(SEXP filenames, SEXP listOfRawVectors)
{

 if( length( filenames) != length( listOfRawVectors))
 {
  error_return( "length of filenames differs from listOfRawVectors");
 }

 RList ret(length(filenames));

 for( int i= 0; i< length(filenames); i++)
 {
  SEXP filename = STRING_ELT(filenames, i);
  SEXP rawVector = VECTOR_ELT(listOfRawVectors, i);

  char const * c_filename = CHAR( filename);

  int res = 0;

  {
   FILE * f;
   if( nullptr == ( f = fopen( c_filename, "wb")))
   {
    res = errno;
   }
   else
   {
    int writeLen = fwrite( RAW(rawVector), 1, length( rawVector), f);

    if( writeLen != length( rawVector))
    {
     res = 100816;
    }

    fclose( f);
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

