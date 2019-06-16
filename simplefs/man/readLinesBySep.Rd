\name{readLinesBySep}
\alias{readLinesBySep}
\title{Read Lines By Separator}
\usage{
readLinesBySep( con, sep = 0)
}
\arguments{
\item{con}{A filename or connection.}
\item{sep}{The separator is a raw or integer value from 0 to 255 with default value 0.}
}
\value{
A character vector.
}
\description{
The function readLinesBySep allows to read fields from a file delimited by a single char which can also be a 0 (zero). This possibility to read in zero terminated fields distinguishes this function from other R standard functions like readLines, scan, read.table, which are not able to process zero termination.
It is intended for use with unix tools like 'find' which allows the output of zero terminated fields via options like '-print0' or '-fprintf <filename> "\%P\0"'.

It makes no difference if the trailing separator exists or not in the input but if it is intended to read in an empty string (line) at the end of the file then it should exist.

It is possible to use another separator than zero but then it should be ensured that the input contains no zeros because the character type is not able to hold zeros.
}
