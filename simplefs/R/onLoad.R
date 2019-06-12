.onLoad <- function( libname, pkgname)
{

 AT_EMPTY_PATH <<- as.hexmode( .Call( "simplefs_get_AT_EMPTY_PATH", PACKAGE="simplefs"))
 AT_NO_AUTOMOUNT <<- as.hexmode( .Call( "simplefs_get_AT_NO_AUTOMOUNT", PACKAGE="simplefs"))
 AT_SYMLINK_NOFOLLOW <<- as.hexmode( .Call( "simplefs_get_AT_SYMLINK_NOFOLLOW", PACKAGE="simplefs"))

 AT_ALL <<- AT_EMPTY_PATH | AT_NO_AUTOMOUNT | AT_SYMLINK_NOFOLLOW

 S_IFSOCK <<- as.octmode( .Call( "simplefs_get_S_IFSOCK", PACKAGE="simplefs"))
 S_IFLNK <<- as.octmode( .Call( "simplefs_get_S_IFLNK", PACKAGE="simplefs"))
 S_IFREG <<- as.octmode( .Call( "simplefs_get_S_IFREG", PACKAGE="simplefs"))
 S_IFBLK <<- as.octmode( .Call( "simplefs_get_S_IFBLK", PACKAGE="simplefs"))
 S_IFDIR <<- as.octmode( .Call( "simplefs_get_S_IFDIR", PACKAGE="simplefs"))
 S_IFCHR <<- as.octmode( .Call( "simplefs_get_S_IFCHR", PACKAGE="simplefs"))
 S_IFIFO <<- as.octmode( .Call( "simplefs_get_S_IFIFO", PACKAGE="simplefs"))
}
