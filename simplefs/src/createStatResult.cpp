
#include "createStatResult.h"

#include "NamedRList.h"

SEXP createStatResult( struct stat const & buf, int res, char const * c_filename)
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

 return namedRList.get();
}


