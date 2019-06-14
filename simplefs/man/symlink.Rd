\name{symlink}
\alias{symlink}
\title{Renames Files}
\usage{
symlink( filenamesTarget, filenamesLinkPath)
}
\arguments{
\item{ filenamesTarget}{ A character vector with target filenames.}
\item{ filenamesLinkPath}{ A character vector with filenames about to create which will point to filenamesTarget.}
}
\value{
A list of lists as long as filenames containing keys "returnValue", "filenameTarget", "filenameLinkPath", see man 2 symlink.
}
\description{
The function 'symlink' creates symbolic links (symlinks) named as "filenamesLinkPath" which will point to "filenamesTarget" and returns the results of that operation in a corresponding list.
}
