
TMPDIR <- tempdir()

fileA <- file.path( TMPDIR, "a.txt")

local( {f <- file( fileA, "w"); close(f);})


stopifnot( all( TRUE == simplefs::fisfile( fileA)) )

stopifnot( all( FALSE == simplefs::fisfile( "")))

stopifnot( all( FALSE == simplefs::fisfile( "/dev/null")))

stopifnot( all( c(TRUE, FALSE, FALSE, FALSE) == simplefs::fisfile( c( fileA, ".", "", "/dev/null"))))

stopifnot( all( c(TRUE, FALSE, FALSE, FALSE) == simplefs::fisfile( c( fileA, ".", "", "/dev/null"), simplefs::AT_EMPTY_PATH)))

stot <- simplefs::stat( c( fileA, ".", "", "/dev/null"))

stopifnot( all( c(TRUE, FALSE, FALSE, FALSE) == simplefs::fisfile( stot)))

fstatot <- simplefs::fstatat( c( fileA, ".", "", "/dev/null"), simplefs::AT_EMPTY_PATH)

stopifnot( all( c(TRUE, FALSE, FALSE, FALSE) == simplefs::fisfile( fstatot)))

