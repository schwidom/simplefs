\name{fis}
\alias{fis}
\alias{fisdir}
\alias{fisfile}
\title{Check File Type}
\usage{

fis( filenames_or_stats, mode, flags= 0)

fisdir( filenames_or_stats, ...)

fisfile( filenames_or_stats, ...)

}
\arguments{
\item{ filenames_or_stats}{ A character vector with filenames or the return value of stat, lstat, fstatat, which is of class stat.}
\item{ mode}{ One of the values S_IFSOCK S_IFLNK S_IFREG S_IFBLK S_IFDIR S_IFCHR S_IFIFO, see: man 2 stat.}
\item{ flags}{ In case of filenames_or_stats is of class character: AT_EMPTY_PATH AT_NO_AUTOMOUNT AT_SYMLINK_NOFOLLOW, see man 2 stat.}
}
\value{
A logical vector as long as filenames_or_stats.
}
\description{
The S3 method 'fis' checks the type of the specified element via comparison of the mode field, see man 2 stat. mode is compared against one of the flags S_IFSOCK S_IFLNK S_IFREG S_IFBLK S_IFDIR S_IFCHR S_IFIFO.
The fisdir is a convenience method for fis with mode = S_IFDIR. It checks that an entry is a directory.
The fisfile is a convenience method for fis with mode = S_IFREG. It checks that an entry is a regular file.
}
