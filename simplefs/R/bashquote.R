bashquote <- function( stringContents)
{ # masterpiece

 as.character( lapply( stringContents, function( stringContent) {

  isPrintableChar <- function( rawValue)
  {
   0x20 <= rawValue & rawValue <= 0x7e
  }

  rawContent <- charToRaw( stringContent)
  rawContentPrintableMask <- isPrintableChar( rawContent)
  rawContentSingleQuoteMask <- rawContent == charToRaw( "'")
  rawContentMetaMask <- rawContent == charToRaw( "\\")

  rawContentDirectlyPrintableMask <- rawContentPrintableMask & !rawContentSingleQuoteMask & !rawContentMetaMask

  stringResult <- character( length(rawContent))

  stringResult[rawContentDirectlyPrintableMask] <- as.character( lapply( rawContent[rawContentDirectlyPrintableMask], rawToChar))

  stringResult[!rawContentPrintableMask] <- sprintf( "\\x%x", as.integer( rawContent[!rawContentPrintableMask]))

  stringResult[rawContentSingleQuoteMask] <- "\\'"
  stringResult[rawContentMetaMask] <- "\\\\"

  paste( sep=''
  , '$\''
  , paste( sep='', collapse='', stringResult)
  , '\''
  )
 }))
}
