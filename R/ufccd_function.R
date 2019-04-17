#' This function generates the design matrix for a unique factor CCD.
#'
#' @param x a matrix of 0's and 1's indicating factor and response relationships.
#'     Rows represent responses; columns represent factors. A 1 represents
#'     that the factor for that column is related to the response for that row.
#' @param ... passes other arguments through ccd.design() from the DoE.wrapper package.
#'     Does not currently support factor.names.
#' @return a data.frame that is a unique factor Central Composite Design with values
#'     coded so that factorial points are 1 and -1
#' @importFrom DoE.wrapper ccd.design
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
#' ufccd(x)
ufccd<-function(x, ...){
  requireNamespace(x, quietly = TRUE)
  uf<-ufactors(x)
  kuf<-max(uf)
  k<-length(uf)
  ufdesign<-ccd.design(nfactors = kuf, factor.names = NULL, ...)
  ufccddesign<-ufdesign[,c(1,uf+1)]
  names(ufccddesign)<-c("Block.ccd",paste0("X",1:k))
  return(ufccddesign)
}
