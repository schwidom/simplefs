
TMPDIR <- tempdir()

local( {f <- file( file.path( TMPDIR, "a.txt"), "w"); close(f);})
local( {f <- file( file.path( TMPDIR, "b.txt"), "w"); close(f);})

stopifnot( all( simplefs::fexists( file.path( TMPDIR, c( "a.txt", "b.txt")))))
stopifnot( !all( simplefs::fexists( file.path( TMPDIR, c( "c.txt", "d.txt")))))

simplefs::rename( file.path( TMPDIR, c( "a.txt", "b.txt")), file.path( TMPDIR, c( "c.txt", "d.txt")))

stopifnot( !all( simplefs::fexists( file.path( TMPDIR, c( "a.txt", "b.txt")))))
stopifnot( all( simplefs::fexists( file.path( TMPDIR, c( "c.txt", "d.txt")))))

simplefs::funlink( file.path( TMPDIR, c( "c.txt", "d.txt")))

stopifnot( !all( simplefs::fexists( file.path( TMPDIR, c( "c.txt", "d.txt")))))

