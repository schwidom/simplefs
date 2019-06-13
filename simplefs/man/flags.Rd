\name{flags}
\alias{flags}
\alias{AT_EMPTY_PATH}
\alias{AT_NO_AUTOMOUNT}
\alias{AT_SYMLINK_NOFOLLOW}
\alias{S_IFBLK}
\alias{S_IFCHR}
\alias{S_IFDIR}
\alias{S_IFIFO}
\alias{S_IFLNK}
\alias{S_IFREG}
\alias{S_IFSOCK}
\title{Stat Modes and Flags}
\usage{
mode flags : S_IFBLK S_IFCHR S_IFDIR S_IFIFO S_IFLNK S_IFREG S_IFSOCK 

fstatat flags: AT_EMPTY_PATH AT_NO_AUTOMOUNT AT_SYMLINK_NOFOLLOW
}
\description{
The mode flags are used with the return value of the functions stat, lstat, fstatat.
The fstatat flags are used for fstatat calls only.

See man 2 stat.
}
