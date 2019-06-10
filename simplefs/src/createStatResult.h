#pragma once

#include <R.h>
#include <Rinternals.h>

extern "C" {
// int lstat(const char *pathname, struct stat *buf);
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
}

SEXP createStatResult( struct stat const & buf, int res, char const * c_filename);


