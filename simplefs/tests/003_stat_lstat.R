
statDot <- simplefs::stat(".")[[1]]

print( statDot)

stopifnot( 0 == statDot$returnValue)
stopifnot( "." == statDot$filename)

stopifnot( 0 != ( as.octmode(statDot$mode) & simplefs::S_IFDIR)) # man 2 stat

statDot <- simplefs::lstat(".")[[1]]

print( statDot)

stopifnot( 0 == statDot$returnValue)
stopifnot( "." == statDot$filename)

stopifnot( 0 != ( as.octmode(statDot$mode) & simplefs::S_IFDIR)) # man 2 stat

