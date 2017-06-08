#' @name confintLME
#' @title Confidence Intervals for LME Fixed Effects
#' 
#' @param outp the lme moel object.
#'
#' @details This function returns the confidence intervals in an organized fashion.
#' @export 
#'
confintLME <- function(outp){
  
  rownames <- names(outp$coefficients$fixed)
  
  CI <- data.frame()
  
  for(i in 1:length(rownames)){
    CI_new <- unlist(confint(outp, parm = i))[1:2]
    CI <- rbind(CI, CI_new)
  }
  
  CI <- data.frame(CI, row.names = rownames)
  
  names(CI) <- c("2.5%", "97.5%")
  
  return(CI)
}