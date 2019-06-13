The Simple FS R Package
=======================

This software provides an extension for [The R Project for Statistical Computing](http://www.R-project.org).

The simplefs package provides an easy way for accessing a linux filesystem mainly driven by direct calls to the the underlying system calls like 'stat', 'unlink', 'rename' and so on. Provided path names keeps hereby untouched so that every relative or absolute name expresses exactly only one path in an unambiguous manner.

R has an implicit tilde expansion mechanism which is adapted from unix but provides no way to quote this tilde so it is not possible for instance to open a file relative to the cwd (current working directory) with a name like '~'. And it is currently not possible to switch off this behaviour. This and the fact that a bug from at least R version 3.1.1 on exists which replaces further tildes in the path if they are surrounded by spaces (readline has to be enabled which is the default in the R console) led me create this package to avoid every path name modification.

In this package no path name modification takes place except I have to rely on already existing functions which carry the old problem but then it is documented.

See the tilde discussion on [r-help](https://stat.ethz.ch/pipermail/r-help/2019-June/thread.html#462876) and [r-devel](https://stat.ethz.ch/pipermail/r-devel/2019-June/thread.html#77961).

Install the package by cloning the repo and running make
- git clone https://github.com/schwidom/simplefs
- cd simplefs
- make

