readLinesBySep <- function( con_insecure, sep = 0)
{

 stopifnot( 1 == length( con_insecure))

 if( is.character(con_insecure))
 {
  fileinfo <- stat(con_insecure)[[1]]

  stopifnot( 0 == fileinfo$returnValue)

  bon <- readBin(con = con_insecure, what='raw', n = fileinfo$size)
 } else
 {
  startSizeToRead <- 10000
  maxSizeToRead <- 2^20 # 2^31 - 1 (readBin)

  bon <- as.raw( c() )

  while(TRUE)
  {
   bonPart <- readBin(con = con_insecure, what='raw', n = startSizeToRead)
   if( 0==length( bonPart)) break;
   bon <- c( bon, bonPart)
   if( startSizeToRead < maxSizeToRead) { startSizeToRead <- 2 * startSizeToRead }
  }
 }

 if( bon[length(bon)] != sep)
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


