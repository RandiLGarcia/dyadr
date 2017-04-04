#' @name mmc
#' @title Monte Carlo confidence interval for the indirect effect
#' 
#' @param a path from X to M.
#' @param b path from M to Y.
#' @param ase standard error for path a.
#' @param bse standard error for path b.
#' @param cov  covariance for a and b (set to zero in MLM, but could be free if using lavaan). Defaults to zero.
#' @param rep  number of replications (defaults to 40,000).
#' @param conf confidence level (defaults to 95).
#' @param dig number of decimal places (defaults to 6)
#'
#' @details Could and maybe should output p value -- code available from last year. Base code taken from Selig and Preacher (2008).
#' @export 
#'
mmc<-function(a,b,ase,bse,cov = 0,rep = 40000,conf = 95, dig = 6) {
  require(MASS)
  
  pest <- c(a,b)
  
  acov <- matrix(c(ase^2,cov,cov,bse^2),2,2)
  mcmc <- mvrnorm(rep,pest,acov,empirical=FALSE)

  
  ab <- mcmc[,1]*mcmc[,2]
  
  cc=0
  for (ii in 1: rep) if (ab[ii] > 0) cc = cc + 1/rep
  
  low <- (1-conf/100)/2
  upp <- ((1-conf/100)/2)+(conf/100)
  
  LB <- format(quantile(ab,low),digits=dig)
  UB <- format(quantile(ab,upp),digits=dig)
  p_value = 1-2*abs(.5- cc)
  
  CI <- cbind.data.frame(LB, UB, p_value)
  return(CI)

}