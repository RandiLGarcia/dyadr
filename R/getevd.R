#' @name getevd
#' @title Error standard deviation for distinguishable dyads
#'
#' Get error standard deviations from the distinguishable model with gls
#' 
#'
#' @param outp is the model object.  Not it is not the "summary" of that object.
#' @param tipe is the type of model object.  It defaults to "gls."  The other option is "lme."
#' @param grp1 is the group 1 of the model object.
#' @param grp2 is the group 2 of the model object.
#'
#' @details some additional details about these functions
#' @export
#'
getevd = function (outp,tipe="gls",grp1="Group 1",grp2="Group 2") {
  vval=c(1,1)
  if (tipe=="gls")
  {ppp =outp[1]$modelStruct[2]
  vval[2] = as.numeric(outp[6])
  vval[1] = vval[2]/attr(ppp$varStruct,"weights")[2]}
  if (tipe=="lme")
  {ppp =outp[1]$modelStruct$varStruct
  vval[2] = as.numeric(outp[6])
  vval[1] = vval[2]/attr(ppp,"weights")[2]}
  names(vval)[1]=grp1
  names(vval)[2]=grp2
  return(vval)}
