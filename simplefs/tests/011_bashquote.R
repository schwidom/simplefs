
openString <- charToRaw( "$'")
closeString <- charToRaw( "'")

stopifnot( simplefs::bashquote( "\\") == "$'\\\\'")
stopifnot( all( charToRaw( simplefs::bashquote( "\\")) == c( openString, as.raw( c( 0x5c, 0x5c)), closeString)))

stopifnot( simplefs::bashquote( "'") == "$'\\''")
stopifnot( all( charToRaw( simplefs::bashquote( "'")) == c( openString, as.raw( c( 0x5c, 0x27)), closeString)))

stopifnot( simplefs::bashquote( "") == "$''")
stopifnot( simplefs::bashquote( "abcdef 1-9") == "$'abcdef 1-9'")

stopifnot( simplefs::bashquote( "\a\b\t\n\v\f\r") == "$'\\x7\\x8\\x9\\xa\\xb\\xc\\xd'")


stopifnot( all( c( simplefs::bashquote( "hello"), simplefs::bashquote( "world")) == c( "$'hello'", "$'world'")))

# utf8:

stopifnot( simplefs::bashquote( "äöüß") == "$'\\xc3\\xa4\\xc3\\xb6\\xc3\\xbc\\xc3\\x9f'")

