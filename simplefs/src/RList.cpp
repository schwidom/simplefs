#include "RList.h"

RList::RList(int count) 
 : m_count{count}
 , m_elementValues{ allocVector(VECSXP, count)}
{
}

void RList::append(SEXP sexp)
{
 SET_VECTOR_ELT( m_elementValues, m_nextElementIdx, sexp);
 ++m_nextElementIdx;
}

void RList::append( int i)
{
 append( ScalarInteger( i));
}

void RList::append( char const * str )
{
 append( mkString( str));
}

SEXP RList::get()
{
 return m_elementValues;
}

 
