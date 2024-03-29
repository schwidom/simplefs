
TMPDIR <- tempdir()

fileA <- file.path( TMPDIR, "a.txt")
fileB <- file.path( TMPDIR, "b.txt")

writeBin( as.raw( c( unlist( lapply( c( 'a', 'b'), charToRaw)), 0, unlist( lapply( c( 'c', 'd'), charToRaw)), 0)), fileA)

writeBin( as.raw( c( unlist( lapply( c( 'a', 'b'), charToRaw)), 0, unlist( lapply( c( 'c', 'd'), charToRaw)))), fileB)

fields <- simplefs::readLinesBySep( fileA)

stopifnot( "ab" == fields[[1]])
stopifnot( "cd" == fields[[2]])

fields <- simplefs::readLinesBySep( fileB)

stopifnot( "ab" == fields[[1]])
stopifnot( "cd" == fields[[2]])

conA <- file( fileA, "rb")

fields <- simplefs::readLinesBySep( conA)

stopifnot( "ab" == fields[[1]])
stopifnot( "cd" == fields[[2]])

close(conA)

conB <- file( fileB, "rb")

fields <- simplefs::readLinesBySep( conB)

stopifnot( "ab" == fields[[1]])
stopifnot( "cd" == fields[[2]])

close(conB)

