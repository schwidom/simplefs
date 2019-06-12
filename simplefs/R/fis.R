
fis <- function( filenames_or_stats, ...)
{
 UseMethod( "fis", filenames_or_stats)
}

fis.character <- function( filenames, mode, flags = 0)
{
 fis.stat( fstatat( filenames, flags), mode= mode)
}

fis.stat <- function( stats, mode)
{
 as.logical( lapply( stats, function( res) {
  res$returnValue == 0 && as.logical( res$mode & mode)
 }))
}
