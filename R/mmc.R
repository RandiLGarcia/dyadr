#' @name mmc
#' @title Monte Carlo confidence interval for the indirect effect
#'
#' Base code taken from Selig and Preacher (2008).
#' 
#' 
#' @param a path from X to M.
#' @param b path from M to Y.
#' @param asesq standard error for path a squared.
#' @param bsesq standard error for path b squared.
#' @param cov  covariance for a and b (set to zero in MLM, but could be free if using lavaan). Defaults to zero.
#' @param rep  number of replications (defaults to 40,000).
#' @param conf confidence level (defaults to 95).
#' @param dig number of decimal places (defaults to 6)
#'
#' @details Could and maybe should output p value -- code available from last year
#' @export 
#'
mmc<-function(a,b,asesq,bsesq,cov = 0,rep = 40000,conf = 95, dig = 6) {
  require(MASS)
  
  pest <- c(a,b)
  
  acov <- matrix(c(asesq^2,cov,cov,bsesq^2),2,2)
  mcmc <- mvrnorm(rep,pest,acov,empirical=FALSE)
  
  ab <- mcmc[,1]*mcmc[,2]
  low <- (1-conf/100)/2
  upp <- ((1-conf/100)/2)+(conf/100)
  
  LB <- format(quantile(ab,low),digits=dig)
  UB <- format(quantile(ab,upp),digits=dig)
  
  CI <- cbind.data.frame(LB, UB)
  return(CI)

}