
stat <- function(filenames)
{
 .Call("simplefs_stat", filenames, PACKAGE="simplefs");
}
