
exists <- function( filenames, flags = 0)
{
 as.logical( lapply( fstatat( filenames, flags), function( res) {
  res$returnValue == 0
 }))
}
