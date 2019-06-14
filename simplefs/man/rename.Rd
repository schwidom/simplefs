\name{rename}
\alias{rename}
\title{Renames Files}
\usage{
rename( filenamesFrom, filenamesTo)
}
\arguments{
\item{ filenamesFrom}{ A character vector with source filenames.}
\item{ filenamesTo}{ A character vector with destination filenames.}
}
\value{
A list of lists as long as filenames containing keys "returnValue", "filenameFrom", "filenameTo", see man 2 rename.
}
\description{
The function 'rename' renames the files given as character vector "filenamesFrom" to the names in "filenamesTo" and returns the results of that operation in a corresponding list.
Currently there is no check whether files maybe get lost for instance by renaming more than one file to the same destination filename. And there is also no check which proves that ab already existing destination is about to get overwritten.
This is subject to future improvements.
}
