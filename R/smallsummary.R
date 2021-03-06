#' @name smallsummary
#' @title Gives a Smaller Summary of gls and lme Objects
#' 
#' @param outp the lme or gls model object.
#' @importFrom stats confint
#' @details This function returns the random effects (lme only), Rho, error variances, 
#' fixed effects, and their confidence intervals. It works for lme objects only.
#' @export 
#'
smallsummary <- function(outp){
  
  if(class(outp) == "lme"){
    print(summary(outp)$modelStruct$reStruct, sigma = summary(outp)$sigma)
    print(round(summary(outp)$tTable, 4))
    cat("\n")
    CI <- round(confintLME(outp), 4)
  }
  
  if(class(outp) == "gls"){
    
    is.distinguishable <- function(mod){
      regexp_string <- "varIdent"
      str_detect(as.character(mod$call)[5], regexp_string)
    }
    
    if(is.distinguishable(outp)){
      print(summary(outp)$modelStruct$corStruct)
      cat("\n")
      print(summary(outp)$modelStruct$varStruct)
      cat("Residual standard error:", summary(outp)$sigma, "\n")
      cat("\n")
      print(round(summary(outp)$tTable, 4))
      cat("\n")
      
      CI <- round(confint(outp), 4)
      
      return(as.matrix(CI)) 
    }
    
    print(summary(outp)$modelStruct$corStruct)
    cat("\n")
    cat("Residual standard error:", summary(outp)$sigma, "\n")
    cat("\n")
    print(round(summary(outp)$tTable, 4))
    cat("\n")
    CI <- round(confint(outp), 4)
    
  }
  
  return(as.matrix(CI)) 
  
}
