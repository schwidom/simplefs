
rename <- function(filenamesFrom, filenamesTo)
{
 .Call("simplefs_rename", filenamesFrom, filenamesTo, PACKAGE="simplefs");
}

