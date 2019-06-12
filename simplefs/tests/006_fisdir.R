
stopifnot( all( TRUE == simplefs::fisdir( ".")) )

stopifnot( all( FALSE == simplefs::fisdir( "")))

stopifnot( all( FALSE == simplefs::fisdir( "/dev/null")))

stopifnot( all( c(TRUE, FALSE, FALSE) == simplefs::fisdir( c( ".", "", "/dev/null"))))

stopifnot( all( c(TRUE, TRUE, FALSE) == simplefs::fisdir( c( ".", "", "/dev/null"), simplefs::AT_EMPTY_PATH)))

stot <- simplefs::stat( c( ".", "", "/dev/null"))

stopifnot( all( c(TRUE, FALSE, FALSE) == simplefs::fisdir( stot)))

fstatot <- simplefs::fstatat( c( ".", "", "/dev/null"), simplefs::AT_EMPTY_PATH)

stopifnot( all( c(TRUE, TRUE, FALSE) == simplefs::fisdir( fstatot)))

