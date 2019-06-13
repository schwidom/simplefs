\name{fexists}
\alias{fexists}
\title{Check File Type}
\usage{
fexists( filenames_or_stats, flags= 0)
}
\arguments{
\item{ filenames_or_stats}{ A character vector with filenames or the return value of stat, lstat, fstatat, which is of class stat.}
\item{ flags}{ In case of filenames_or_stats is of class character: AT_EMPTY_PATH AT_NO_AUTOMOUNT AT_SYMLINK_NOFOLLOW, see man 2 stat.}
}
\value{
A logical vector as long as filenames_or_stats.
}
\description{
The S3 method 'fexists' checks the existence of an directory via the returnValue of the methods stat, lstat, fstatat (if it is a filename).
}
