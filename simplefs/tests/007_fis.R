
stopifnot( all( TRUE == simplefs::fis( ".", simplefs::S_IFDIR )) )

stopifnot( all( FALSE == simplefs::fis( "", simplefs::S_IFDIR )))

stopifnot( all( FALSE == simplefs::fis( "/dev/null", simplefs::S_IFDIR)))

stopifnot( all( c(TRUE, FALSE, FALSE) == simplefs::fis( c( ".", "", "/dev/null"), simplefs::S_IFDIR)))

stopifnot( all( c(TRUE, TRUE, FALSE) == simplefs::fis( c( ".", "", "/dev/null"), simplefs::S_IFDIR, simplefs::AT_EMPTY_PATH)))

stopifnot( all( c(TRUE, TRUE, TRUE) == simplefs::fis( c( ".", "", "/dev/null"), simplefs::S_IFDIR | simplefs::S_IFCHR , simplefs::AT_EMPTY_PATH)))

stot <- simplefs::stat( c( ".", "", "/dev/null"))

stopifnot( all( c(TRUE, FALSE, FALSE) == simplefs::fis( stot, simplefs::S_IFDIR)))

fstatot <- simplefs::fstatat( c( ".", "", "/dev/null"), simplefs::AT_EMPTY_PATH)

stopifnot( all( c(TRUE, TRUE, FALSE) == simplefs::fis( fstatot, simplefs::S_IFDIR)))

stopifnot( all( c(TRUE, TRUE, TRUE) == simplefs::fis( fstatot, simplefs::S_IFDIR | simplefs::S_IFCHR )))

