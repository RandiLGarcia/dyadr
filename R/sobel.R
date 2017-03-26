#' @name sobel
#' @title Soboel Method for Testing Idirect Effect
#'
#' The Sobel method is concervative. Use mmc, or bootstrapping if marginal.
#' 
#' 
#' @param a path from X to M.
#' @param b path from M to Y.
#' @param asesq standard error for path a squared.
#' @param bsesq standard error for path b squared.
#'
#' @details Could and maybe should output p value -- code available from last year
#' @export 
#'
sobel <- function(a, b, asesq, bsesq){
  
  ab <- a*b
  ab_se <- sqrt(a^2*bsesq^2+b^2*asesq^2)
  z <- ab/ab_se
  
  ifelse(ab > 0, p <- 2*pnorm(z, lower.tail=FALSE), p <- 2*pnorm(z))
  
  return(data.frame(indirect_effect = ab, z_value = z, p_value = format(p, digits = 4, scientific = FALSE)))
  
}