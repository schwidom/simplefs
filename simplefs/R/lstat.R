
lstat <- function(filenames)
{
 ret <- .Call("simplefs_lstat", filenames, PACKAGE="simplefs")
 class(ret) <- c( "stat", class(ret))
 ret
}
