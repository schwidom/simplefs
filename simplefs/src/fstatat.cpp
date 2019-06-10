
#include "fstatat.h"

#include "RList.h"
#include "NamedRList.h"

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
  
  {
   int numberOfResultFields = 2;
   if( 0 == res ) numberOfResultFields += 13; 

   NamedRList namedRList( numberOfResultFields);

   namedRList.append( "filename", c_filename);
   namedRList.append( "returnValue", res);

   if(0 == res)
   {
    
    auto appendValueTimespec = [&namedRList]( struct timespec const & ts, char const * name) -> void { 

     NamedRList namedRListTimeSpec( 2);

     namedRListTimeSpec.append( "sec", ts . tv_sec);
     namedRListTimeSpec.append( "nsec", ts . tv_nsec);

     namedRList.append( name, namedRListTimeSpec.get());
    };

    namedRList.append( "dev", buf . st_dev);
    namedRList.append( "ino", buf . st_ino);
    namedRList.append( "mode", buf . st_mode);
    namedRList.append( "nlink", buf . st_nlink);
    namedRList.append( "uid", buf . st_uid);
    namedRList.append( "gid", buf . st_gid);
    namedRList.append( "rdev", buf . st_rdev);
    namedRList.append( "size", buf . st_size);
    namedRList.append( "blksize", buf . st_blksize);
    namedRList.append( "blocks", buf . st_blocks);

    appendValueTimespec(buf . st_atim, "atim");
    appendValueTimespec(buf . st_mtim, "mtim");
    appendValueTimespec(buf . st_ctim, "ctim");
   }

   ret.append( namedRList.get());
  } 

 }

 return ret.get();
}

