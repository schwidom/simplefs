bashquote <- function( stringContents)
{ # masterpiece

 as.character( lapply( stringContents, function( stringContent) {

  rawContent <- charToRaw( stringContent)
  rawContentAsciiMask <- rawContent < 0x7f
  rawContentSingleQuoteMask <- rawContent == charToRaw( "'")
  rawContentAsciiMaskWithoutQuotes <- rawContentAsciiMask & ! rawContentSingleQuoteMask

  stringResult <- character( length(rawContent))

  stringResult[rawContentAsciiMaskWithoutQuotes] <- as.character( lapply( rawContent[rawContentAsciiMaskWithoutQuotes], rawToChar))

  stringResult[!rawContentAsciiMask] <- sprintf( "\\x%x", as.integer( rawContent[!rawContentAsciiMask]))

  stringResult[rawContentSingleQuoteMask] <- "\\'"

  paste( sep=''
  , '$\''
  , paste( sep='', collapse='', stringResult)
  , '\''
  )
 }))
}
