
lstat <- function(filenames)
{
 .Call("simplefs_lstat", filenames, PACKAGE="simplefs");
}
