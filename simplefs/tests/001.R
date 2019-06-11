
stopifnot( all( TRUE == simplefs::fexists( ".")) )

stopifnot( all( FALSE == simplefs::fexists( "")))

stopifnot( all( c(TRUE, FALSE) == simplefs::fexists( c( ".", ""))))

stopifnot( all( c(TRUE, TRUE) == simplefs::fexists( c( ".", ""), simplefs::AT_EMPTY_PATH)))

