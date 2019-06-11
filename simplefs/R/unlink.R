
unlink <- function(filenames)
{
 .Call("simplefs_unlink", filenames, PACKAGE="simplefs");
}
