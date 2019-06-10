
#include "exists.h"

#include <iostream>

extern "C" {
// int stat(const char *pathname, struct stat *buf);
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
}

extern "C" SEXP simplefs_exists(SEXP filenames)
{
 
 // PROTECT

 /* // TODO : remove
 std::cout << "called exists " << std::endl;
 std::cout << "called length " << length(filenames) << std::endl;

 for( int i= 0; i< length(filenames); i++)
 {
  std::cout << STRING_ELT(filenames, i) << std::endl;
  std::cout << CHAR( STRING_ELT(filenames, i)) << std::endl;
 }

 SEXP ret =  allocVector(LGLSXP, length(filenames));

 for( int i= 0; i< length(filenames); i++)
 {
  LOGICAL(ret)[i] = TRUE;
 }
 */

 SEXP ret =  allocVector(LGLSXP, length(filenames));

 for( int i= 0; i< length(filenames); i++)
 {
  char const * c_filename = CHAR( STRING_ELT(filenames, i));
  struct stat buf;
  int res = stat( c_filename, &buf);
  
  LOGICAL(ret)[i] = ( 0 == res);
 }
 
 return ret;
}

