\name{funlink}
\alias{funlink}
\title{Deletes Files}
\usage{
funlink( filenames)
}
\arguments{
\item{ filenames}{ A character vector with filenames which are intended to be deleted.}
}
\value{
A list of lists as long as filenames containing keys "returnValue" and "filename", see man 2 unlink.
}
\description{
The function 'funlink' deletes the files given as character vector and returns the results of that operation in a corresponding list.
}
