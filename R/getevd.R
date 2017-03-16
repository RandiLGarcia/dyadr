#' @name getevd
#' @title Error standard deviation for distinguishable dyads
#'
#' Get error standard deviations from the distinguishable model
#' 
#'
#' @param outp is the model object.
#'
#' @details some additional details about these functions
#' @export
#'
getevd = function (outp) {
  ppp =outp[1]$modelStruct[2]
  vval[2] = as.numeric(outp[6])
  vval[1] = vval[2]/attr(ppp$varStruct,"weights")[2]
  return(vval)}