#include "NamedRList.h"

NamedRList::NamedRList(int count) 
 : m_count{count}
 , m_elementNames{ allocVector(VECSXP, count)} // TODO : STRSXP
 , m_elementValues{ allocVector(VECSXP, count)}
{
}

void NamedRList::append(char const * name, SEXP sexp)
{
 SET_VECTOR_ELT( m_elementValues, m_nextElementIdx, sexp);
 SET_VECTOR_ELT( m_elementNames, m_nextElementIdx, mkString( name));
 ++m_nextElementIdx;
}

void NamedRList::append(char const * name, int i )
{
 append( name, ScalarInteger( i));
}

void NamedRList::append(char const * name, char const * str )
{
 append( name, mkString( str));
}

SEXP NamedRList::get()
{
 return namesgets( m_elementValues, m_elementNames);
}

 
