
stopifnot( all( TRUE == simplefs::exists( ".")) )

stopifnot( all( FALSE == simplefs::exists( "")))

stopifnot( all( c(TRUE, FALSE) == simplefs::exists( c( ".", ""))))

stopifnot( all( c(TRUE, TRUE) == simplefs::exists( c( ".", ""), simplefs::AT_EMPTY_PATH)))

