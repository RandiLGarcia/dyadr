#' @name crsp
#' @title Multiple Pseudo R-squared
#'
#' Get multiple R Squared 
#' 
#'
#' @param esdmod is error standard deviation of the model of interest.
#' @param esdemod is error standard deviation of the empty model.
#' @param indistinguishable is to check whether...
#' 
#'
#' @details some additional details about these functions
#' @export
#
crsp = function (esdmod, esdemod, indistinguishable = TRUE) {
  if(indistinguishable){
    rsq =1 - esdmod^2/esdemod^2
    if (rsq<0) rsq=0
    return(rsq)
  }
  # 
  # if(!indistinguishable){
  #   rsq =1 - esdmod^2/esdemod^2
  #   if (rsq<0) rsq=0
  #   return(rsq)
  # }
  # 
}
