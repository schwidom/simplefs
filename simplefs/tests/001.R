
stopifnot( all( TRUE == simplefs::exists( ".")) )

stopifnot( all( FALSE == simplefs::exists( "")))

stopifnot( all( c(TRUE, FALSE) == simplefs::exists( c( ".", ""))))

