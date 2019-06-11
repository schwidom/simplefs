
TMPDIR <- tempdir()

fileA <- file.path( TMPDIR, "a.txt")

writeBin( as.raw( c( unlist( lapply( c( 'a', 'b'), charToRaw)), 0, unlist( lapply( c( 'c', 'd'), charToRaw)), 0)), fileA)

fields <- simplefs::readLinesBySep( fileA)

stopifnot( "ab" == fields[[1]])
stopifnot( "cd" == fields[[2]])

fields <- simplefs::readLinesBySep( fileA, appendSep = TRUE)

stopifnot( "ab" == fields[[1]])
stopifnot( "cd" == fields[[2]])
stopifnot( "" == fields[[3]])

