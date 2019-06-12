
fexists <- function( filenames_or_stats, ...)
{
 UseMethod( "fexists", filenames_or_stats)
}

fexists.character <- function( filenames, flags = 0)
{
 fexists.stat( fstatat( filenames, flags))
}

fexists.stat <- function( stats)
{
 as.logical( lapply( stats, function( res) {
  res$returnValue == 0
 }))
}
