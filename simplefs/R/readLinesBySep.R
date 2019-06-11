readLinesBySep <- function( filename, sep = 0)
{

 stopifnot( 1 == length( filename))

 fileinfo <- stat(filename)[[1]]

 stopifnot( 0 == fileinfo$returnValue)

 bon <- readBin(con = filename, what='raw', n = fileinfo$size)

 if( bon[fileinfo$size] != sep)
 {
  bon <- c( bon, sep)
 }
 
 bonMask <- sep == bon
 bonMaskPositions <- which(bonMask)
 
 fieldsCount = sum(bonMask)
 
 as.character( lapply( 1:fieldsCount, function(idx) {
  von <- if( 1==idx) { 1} else {bonMaskPositions[idx-1] +1}
  bis <- bonMaskPositions[idx]-1
  rawToChar(as.raw(bon[von:bis]))
 }))
}


