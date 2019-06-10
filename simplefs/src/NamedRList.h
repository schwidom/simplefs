#pragma once

#include <R.h>
#include <Rinternals.h>

class NamedRList
{
public:

 NamedRList(int count);

 SEXP get();

 void append( char const * name, SEXP sexp);

 void append( char const * name, int i);

 void append( char const * name, char const * str);

private:

 int m_nextElementIdx{0};
 int m_count;
 SEXP m_elementNames;
 SEXP m_elementValues;

};
