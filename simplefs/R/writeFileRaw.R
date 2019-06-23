
writeFileRaw <- function( filenames, listOfRawVectors)
{
 .Call( "simplefs_writeFileRaw", filenames, listOfRawVectors, PACKAGE="simplefs")
}
