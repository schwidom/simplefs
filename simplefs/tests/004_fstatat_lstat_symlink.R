
TMPDIR <- tempdir()

fileA <- file.path( TMPDIR, "a.txt")
fileB <- file.path( TMPDIR, "b.txt")
fileC <- file.path( TMPDIR, "c.txt")
fileD <- file.path( TMPDIR, "d.txt")

local( {f <- file( fileA, "w"); close(f);})

simplefs::symlink( fileA, fileB) 

simplefs::symlink( fileC, fileD)

stopifnot( 0 == simplefs::fstatat( file.path( TMPDIR, "b.txt"))[[1]]$returnValue)
simplefs::fstatat( file.path( TMPDIR, "d.txt"))
stopifnot( 2 == simplefs::fstatat( file.path( TMPDIR, "d.txt"))[[1]]$returnValue)
stopifnot( 0 == simplefs::fstatat( file.path( TMPDIR, "d.txt"), simplefs::AT_SYMLINK_NOFOLLOW)[[1]]$returnValue)
stopifnot( 0 == simplefs::lstat( file.path( TMPDIR, "d.txt"))[[1]]$returnValue)


