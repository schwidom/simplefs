
fbasename_position <- function( filenames)
{
 lapply( filenames, function( filename) {

 r <- charToRaw( filename)
 lr <- length( r)

 if( 0==lr) return( as.integer( c( 1, 0)))

 rawSlash <- charToRaw( "/")

 slashDrop <- 0

 wl <- rawSlash == r

 if( 0==length( wl)) return( as.integer( c( 1, lr)))

 # remove trailing slashes
 for( i in lr:1)
 {
  if( wl[i]) slashDrop <- slashDrop + 1
  else break;
 }

 w <- which( wl)

 lw <- length( w)

 if( slashDrop == lr){ as.integer( lr + c( 1, 0)) }
 else {

  rawStart <- 1
  rawStop <- lr - slashDrop

  if( rawStop < rawStart) { as.integer( c( 1, 0)) } # TODO: when exactly happens this?
  else
  {
   if( 0 != ( lw - slashDrop)) rawStart <- 1 + w[lw - slashDrop]

   as.integer( c( rawStart, rawStop))
  }
 }

 })
}

fbasename <- function( filenames)
{

 poss <- fbasename_position(filenames)

 as.character( lapply( 1:length(filenames), function( n) {

 filename <- filenames[[n]]

 pos <- poss[[n]]

 rawStart <- pos[[1]]
 rawStop <- pos[[2]]

 if( rawStop < rawStart) { "" }
 else
 {
  rawToChar( charToRaw(filename)[rawStart:rawStop])
 }

 }))
}

'fbasename<-' <- function( `*tmp*`, value)
{
 
 trueRange1 <- function( von, bis) # TODO:generalize
 {
  if( (bis - 1) < von) return( NULL)
  von:(bis - 1)
 }

 lt <- length( `*tmp*`)

 if( 0 == lt) return(character(0))

 values <- rep_len( value, lt)

 poss <- fbasename_position(`*tmp*`)

 as.character( lapply( 1:lt, function( n)
 {
  filename = `*tmp*`[[n]]
  pos <- poss[[n]]
  value <- values[[n]]

  rawStart <- pos[[1]]
  rawStop <- pos[[2]]

  rawFileName <- charToRaw(filename)

  rawToChar( c( rawFileName[trueRange1(1, rawStart)], charToRaw(value), rawFileName[trueRange1(rawStop + 1, 1 + length(rawFileName))]))

 }))
}
