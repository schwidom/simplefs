
exists <- function(filenames)
{
 .Call("simplefs_exists", filenames, PACKAGE="simplefs");
}
