
fisdir <- function( filenames_or_stats, ...)
{
 UseMethod( "fisdir", filenames_or_stats)
}

fisdir.character <- function( filenames, flags = 0)
{
 fisdir.stat( fstatat( filenames, flags))
}

fisdir.stat <- function( stats)
{
 as.logical( lapply( stats, function( res) {
  res$returnValue == 0 && as.logical( res$mode & S_IFDIR)
 }))
}
