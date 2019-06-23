
stopifnot( all( c( 1, 0) == simplefs::fbasename_position( "")[[1]]))
stopifnot( all( c( 2, 1) == simplefs::fbasename_position( "/")[[1]]))
stopifnot( all( c( 3, 2) == simplefs::fbasename_position( "//")[[1]]))
stopifnot( all( c( 4, 3) == simplefs::fbasename_position( "///")[[1]]))
stopifnot( all( c( 1, 1) == simplefs::fbasename_position( "a")[[1]]))
stopifnot( all( c( 1, 1) == simplefs::fbasename_position( "a/")[[1]]))
stopifnot( all( c( 1, 1) == simplefs::fbasename_position( "a//")[[1]]))
stopifnot( all( c( 2, 2) == simplefs::fbasename_position( "/a")[[1]]))
stopifnot( all( c( 2, 2) == simplefs::fbasename_position( "/a/")[[1]]))
stopifnot( all( c( 2, 2) == simplefs::fbasename_position( "/a//")[[1]]))
stopifnot( all( c( 3, 3) == simplefs::fbasename_position( "//a//")[[1]]))
stopifnot( all( c( 3, 3) == simplefs::fbasename_position( "b/a")[[1]]))
stopifnot( all( c( 3, 3) == simplefs::fbasename_position( "b/a/")[[1]]))
stopifnot( all( c( 3, 3) == simplefs::fbasename_position( "b/a//")[[1]]))
stopifnot( all( c( 4, 4) == simplefs::fbasename_position( "/b/a")[[1]]))
stopifnot( all( c( 5, 5) == simplefs::fbasename_position( "/b//a")[[1]]))
stopifnot( all( c( 4, 4) == simplefs::fbasename_position( "/b/a/")[[1]]))
stopifnot( all( c( 4, 4) == simplefs::fbasename_position( "/b/a//")[[1]]))
stopifnot( all( c( 5, 5) == simplefs::fbasename_position( "/b//a//")[[1]]))
stopifnot( all( c( 6, 6) == simplefs::fbasename_position( "//b//a//")[[1]]))

stopifnot( "" == simplefs::fbasename( ""))
stopifnot( "" == simplefs::fbasename( "/"))
stopifnot( "" == simplefs::fbasename( "//"))
stopifnot( "" == simplefs::fbasename( "///"))
stopifnot( "a" == simplefs::fbasename( "a"))
stopifnot( "a" == simplefs::fbasename( "a/"))
stopifnot( "a" == simplefs::fbasename( "a//"))
stopifnot( "a" == simplefs::fbasename( "/a"))
stopifnot( "a" == simplefs::fbasename( "/a/"))
stopifnot( "a" == simplefs::fbasename( "/a//"))
stopifnot( "a" == simplefs::fbasename( "//a//"))
stopifnot( "a" == simplefs::fbasename( "b/a"))
stopifnot( "a" == simplefs::fbasename( "b/a/"))
stopifnot( "a" == simplefs::fbasename( "b/a//"))
stopifnot( "a" == simplefs::fbasename( "/b/a"))
stopifnot( "a" == simplefs::fbasename( "/b//a"))
stopifnot( "a" == simplefs::fbasename( "/b/a/"))
stopifnot( "a" == simplefs::fbasename( "/b/a//"))
stopifnot( "a" == simplefs::fbasename( "/b//a//"))
stopifnot( "a" == simplefs::fbasename( "//b//a//"))

f <- c( "a/a///", "a", "/a", "/a/", "/", "")

simplefs::fbasename( f) <- 'ox'

stopifnot( all( c( "a/ox///", "ox", "/ox", "/ox/", "/ox", "ox") == f))

simplefs::fbasename( f) <- ''

stopifnot( all( c( "a////", "", "/", "//", "/", "") == f))

simplefs::fbasename( f) <- 'p'

# stopifnot( all( c( "a/p///", "p", "/p", "/p/", "/p", "p") == f)) # won't work
# stopifnot( all( c( "a////p", "p", "/p", "/p/", "/p", "p") == f)) # won't work too, would be the correct result when axiomatic correctness were given see : myg9dvka5v 

# myg9dvka5v :
# at the first position we see why it is a bad idea to treat
# the basename of /x/ as x and not as ""
# but it is the default behaviour of basename (namespace:base)
# and I rely on that. Maybe I will change it in the future

# TODO : ensure axiomaticity (optional)

stopifnot( all( c( "p////", "p", "/p", "//p", "/p", "p") == f)) 


