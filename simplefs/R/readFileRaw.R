
readFileRaw <- function( filenames)
{
 .Call( "simplefs_readFileRaw", filenames, PACKAGE="simplefs")
}
