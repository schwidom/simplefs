#pragma once

#include <R.h>
#include <Rinternals.h>

class RList
{
public:

 RList(int count);

 SEXP get();

 void append( SEXP sexp);

 void append( int i);

 void append( char const * str);

private:

 int m_nextElementIdx{0};
 int m_count;
 SEXP m_elementValues;

};
