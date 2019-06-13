\name{stat}
\alias{stat}
\alias{lstat}
\alias{fstatat}
\title{Gain File Information}
\usage{
stat( filenames)

lstat( filenames)

fstatat(filenames, flags = 0L)
}
\arguments{
\item{ filenames}{ A character vector with filenames.}
\item{ flags}{ AT_EMPTY_PATH AT_NO_AUTOMOUNT AT_SYMLINK_NOFOLLOW, see man 2 stat, see ? flags.}
}
\value{
A list of class stat which holds per element a list of stat structure entries, see man 2 stat.
}
\description{
The functions stat, lstat, fstatat calls the corresponding linux calls.
In case of fstatat the first parameter of the the c-function holds the value AT_FDCWD so that this operation is relative to the cwd (current working directory) when a relative path is given in filenames, see man 2 stat.
}
