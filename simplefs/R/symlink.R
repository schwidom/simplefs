
symlink <- function(filenamesTarget, filenamesLinkPath)
{
 .Call("simplefs_symlink", filenamesTarget, filenamesLinkPath, PACKAGE="simplefs");
}

