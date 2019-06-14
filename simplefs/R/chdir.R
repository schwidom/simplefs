
chdir <- function(filenames)
{
 .Call("simplefs_chdir", filenames, PACKAGE="simplefs");
}
