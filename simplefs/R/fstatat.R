
# gets set by .onLoad in onLoad.R

AT_EMPTY_PATH <- as.hexmode(0)
AT_NO_AUTOMOUNT <- as.hexmode( 0)
AT_SYMLINK_NOFOLLOW <- as.hexmode( 0)

S_IFSOCK <- as.octmode( 0)
S_IFLNK <- as.octmode( 0)
S_IFREG <- as.octmode( 0)
S_IFBLK <- as.octmode( 0)
S_IFDIR <- as.octmode( 0)
S_IFCHR <- as.octmode( 0)
S_IFIFO <- as.octmode( 0)

AT_ALL <- as.hexmode( 0)

fstatat <- function(filenames, flags = 0L)
{
 
 stopifnot( AT_ALL == (AT_ALL | flags))

 ret <- .Call("simplefs_fstatat", as.character( filenames), as.integer( flags), PACKAGE="simplefs");

 class(ret) <- c( "stat", class(ret))

 ret
}
