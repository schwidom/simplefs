
TMPDIR <- tempdir()

local( {f <- file( file.path( TMPDIR, "a.txt"), "w"); close(f);})

simplefs::symlink( file.path( TMPDIR, "a.txt"), file.path( TMPDIR, "b.txt"))

simplefs::symlink( file.path( TMPDIR, "c.txt"), file.path( TMPDIR, "d.txt"))

stopifnot( 0 == simplefs::fstatat( file.path( TMPDIR, "b.txt"))[[1]]$returnValue)
stopifnot( -1 == simplefs::fstatat( file.path( TMPDIR, "d.txt"))[[1]]$returnValue)
stopifnot( 0 == simplefs::fstatat( file.path( TMPDIR, "d.txt"), simplefs::AT_SYMLINK_NOFOLLOW)[[1]]$returnValue)


