\name{readLinesBySep}
\alias{readLinesBySep}
\docType{package}
\title{Read Lines By Separator}
\description{
The function readLinesBySep allows to read fields from a file delimited by a single char which can also be a 0 (zero). This possibility to read in zero terminated fields distinguishes this function from other R standard functions like readLines, scan, read.table, which are not able to process zero termination.
It is intended for use with unix tools like 'find' which allows the output zero terminated via options like '-print0' or '-fprintf <filename> "\%P\0"'.
}
