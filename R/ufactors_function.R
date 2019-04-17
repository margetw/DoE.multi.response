#' This function generates the unique factors for a unique factor CCD.
#'
#' @param x a matrix of 0's and 1's indicating factor and response relationships.
#'     Rows represent responses; columns represent factors. A 1 represents
#'     that the factor for that column is related to the response for that row.
#' @return numeric vector indicating unique factors
#' @export
#' @examples
#' #Response 1 is related to factors 1, 2, and 3
#' #Response 2 is related to factors 2, 3, and 4
#' #Response 3 is related to factors 1, 3, and 5
#' #Response 4 is related to factors 1 and 4
#' x<-matrix(c(1,1,1,0,0,
#'             0,1,1,1,0,
#'             1,0,1,0,1,
#'             1,0,0,1,0), nrow = 4,byrow = TRUE)
#' ufactors(x)

ufactors<-function(x){
  ufx<-x[,1]
  uflist<-1
  for(i in 2:dim(x)[2]){
    if(checkuf(ufx,x[,i])){
      uflist[i]<-minwhichuf(ufx,x[,i])
      ufx<-addtouf(ufx,x[,i],uflist[i])}
    else{ufx<-cbind(ufx,x[,i])
    uflist[i]<-dim(ufx)[2]}
  }
  return(uflist)
}

#Helper for ufactors: returns a logical indicator of wheather an existing unique facor can be used
checkuf <- function(x,a){
  if(is.matrix(x)){any(apply(x,2,function(y) all(y+a<=1)))}
  else{all(x+a<=1)}
}

#Helper for ufactors: returns minimum available existing unique factors that can been assigned
minwhichuf <- function(x,a){
  if(is.matrix(x)){min(which(apply(x,2,function(y) all(y+a<=1))))}
  else{which(all(x+a<=1))}
}

#Helper for ufactors: adds response relationship to a unique factor when a new factor is assigned to it
addtouf <- function(x,a,uf){
  if(is.matrix(x)){x[,uf]<-x[,uf]+a; x}
  else{x<-x+a; x}
}
