dataNormalized<-function(aVector){
  liq=aVector
  for (i in 1:nrow( liq)) {
    if(i>1){
      prev= liq[i-1,]
      liq[i,'evolution']= liq[i,'evolution']-prev$evolution
      liq[i,'corretion']= liq[i,'corretion']- prev$corretion
    }
  }
  return(liq)
}