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
    cat("\n")
    print(round(summary(outp)$tTable, 4))
    CI <- confintLME(outp)
  }
  
  if(class(outp) == "gls"){
    print(round(summary(outp)$modelStruct$corStruct, 4))
    cat("\n")
    print(round(summary(outp)$modelStruct$varStruct, 4))
    cat("Residual standard error:", summary(outp)$sigma, "\n")
    cat("\n")
    print(round(summary(outp)$tTable, 4))
    cat("\n")
    CI <- round(confint(outp), 4)
  }
  
  return(as.matrix(CI)) 
  
}
