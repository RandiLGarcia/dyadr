#' @name smallsummary
#' @title Gives a Smaller Summary of gls and lme Objects
#' 
#' @param outp the lme or gls model object.
#'
#' @details This function returns the random effects (lme only), Rho, error variances, fixed effects, and their confidence intervals.
#' @export 
#'
smallsummary <- function(outp){
  
  if(class(outp) == "lme"){
    print(summary(outp)$modelStruct$reStruct)
  }
  
  print(summary(outp)$modelStruct$corStruct)
  print(summary(outp)$modelStruct$varStruct)
  print(summary(outp)$tTable)
  
  return(as.matrix(confintLME(outp))) 
  
}