#' @name crsp
#' @title Multiple Pseudo R-squared
#'
#' Get multiple R Squared 
#' 
#'
#' @param esdmod is error standard devisiation of the model.
#'
#' @details some additional details about these functions
#' @export
#
crsp = function (esdmod,esdemod) {
  rsq =1 - esdmod^2/esdemod^2
  if (rsq<0) rsq=0
  return(rsq)}