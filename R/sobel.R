#' @name sobel
#' @title Soboel Method for Testing Idirect Effect
#'
#' 
#' 
#' 
#' @param a path from X to M.
#' @param b path from M to Y.
#' @param ase standard error for path a.
#' @param bse standard error for path b.
#'
#' @details The Sobel method is conservative. Use mmc, or bootstrapping if marginal. The Sobel test also presumes a and b are uncorrelated. 
#' @export 
#'
sobel <- function(a, b, ase, bse){
  
  ab <- a*b
  ab_se <- sqrt(a^2*bse^2+b^2*ase^2)
  z <- ab/ab_se
  
  ifelse(ab > 0, p <- 2*pnorm(z, lower.tail=FALSE), p <- 2*pnorm(z))
  
  return(data.frame(indirect_effect = ab, z_value = z, p_value = format(p, digits = 4, scientific = FALSE)))
  
}