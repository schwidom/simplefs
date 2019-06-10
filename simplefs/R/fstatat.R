
# see man stat
AT_EMPTY_PATH <- as.octmode( 0x1000)
AT_NO_AUTOMOUNT <- as.octmode( 0x800)
AT_SYMLINK_NOFOLLOW <- as.octmode( 0x100)

AT_ALL <- AT_EMPTY_PATH | AT_NO_AUTOMOUNT | AT_SYMLINK_NOFOLLOW


fstatat <- function(filenames, flags = 0L)
{

 stopifnot( AT_ALL == (AT_ALL | flags))

 .Call("simplefs_fstatat", as.character( filenames), as.integer( flags), PACKAGE="simplefs");
}
