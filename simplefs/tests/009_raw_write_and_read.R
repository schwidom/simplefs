
TMPDIR <- tempdir()

fileA <- file.path( TMPDIR, "a.txt")
fileB <- file.path( TMPDIR, "b.txt")

# file contents
contentA = charToRaw( "Hello")
contentB = charToRaw( "World")

simplefs::writeFileRaw( c(fileA, fileB), list( contentA, contentB))

contents <- simplefs::readFileRaw( c(fileB, fileA))[2:1]

stopifnot( "Hello" == rawToChar( contents[[1]]$result))
stopifnot( "World" == rawToChar( contents[[2]]$result))

