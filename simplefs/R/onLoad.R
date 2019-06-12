.onLoad <- function( libname, pkgname)
{
 AT_EMPTY_PATH <<- as.hexmode( .Call( "simplefs_get_AT_EMPTY_PATH", PACKAGE="simplefs"))
 AT_NO_AUTOMOUNT <<- as.hexmode( .Call( "simplefs_get_AT_NO_AUTOMOUNT", PACKAGE="simplefs"))
 AT_SYMLINK_NOFOLLOW <<- as.hexmode( .Call( "simplefs_get_AT_SYMLINK_NOFOLLOW", PACKAGE="simplefs"))

 AT_ALL <<- AT_EMPTY_PATH | AT_NO_AUTOMOUNT | AT_SYMLINK_NOFOLLOW
}
