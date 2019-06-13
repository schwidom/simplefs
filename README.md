The Simple FS R Package
=======================

This software provides an extension for [The R Project for Statistical Computing](http://www.R-project.org).

The simplefs package provides an easy way for accessing a linux filesystem mainly driven by direct calls to the the underlying system calls like 'stat', 'unlink', 'rename' and so on. Provided path names keeps hereby untouched so that every relative or absolute name expresses exactly only one path in an unambiguous manner.

R has an implicit tilde ('~') expansion mechanism which is adapted from unix but provides no way to quote this tilde to make it part of the path so it is not possible for instance to open a file relative to the cwd (current working directory) with a name like '~'. And it is currently not possible to switch off this behaviour. This and the fact that there is a pending bug according to tilde expansion urged me to create the simplefs package.

In this package no path name modification takes place except I have to rely on already existing functions which carry the same tilde expansion problem. But then it is clearly documented.

See the tilde discussion on [r-help](https://stat.ethz.ch/pipermail/r-help/2019-June/thread.html#462876) and [r-devel](https://stat.ethz.ch/pipermail/r-devel/2019-June/thread.html#77961).

Install the package by cloning the repo and running make:
- git clone https://github.com/schwidom/simplefs
- cd simplefs
- make

