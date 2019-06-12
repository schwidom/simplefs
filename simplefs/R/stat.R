
stat <- function(filenames)
{
 ret <- .Call("simplefs_stat", filenames, PACKAGE="simplefs");
 class(ret) <- c( "stat", class(ret))
 ret
}
