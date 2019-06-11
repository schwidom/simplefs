#pragma once

#include <R.h>
#include <Rinternals.h>

class RList
{
public:

 RList(int count);

 ~RList();

 RList(const RList&) = delete;
 RList(RList&&) = delete;
 RList& operator=(const RList&) = delete;
 RList& operator=(RList&&) = delete;

 SEXP get();

 void append( SEXP sexp);

 void append( int i);

 void append( char const * str);

private:

 int m_nextElementIdx{0};
 int m_count;
 SEXP m_elementValues;

};
