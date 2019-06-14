
ftouch <- function(filenames)
{
 .Call("simplefs_touch", filenames, PACKAGE="simplefs");
}
