#' @name lincomb
#' @title Tests of contrasts
#'
#' Test the sum (S), the average (A), or the difference (D) of two effects from the same model.
#'
#'
#' @param outp is the model object. For exmaple, summary(mod). It can be a gls or lme object.
#' @param v1 is the number of the first effect.
#' @param v2 is the number of the second effect.
#' @param fun is the comparison. Default fun = "D". Other options include "S" the sum, and "A" the average.
#' @importFrom stats pnorm
#' @details some additional details about these functions
#' @export
#'
#
lincomb <- function(outp, v1, v2, fun = "D") {
  outp <- summary(outp)

  vval <- matrix()

  if (class(outp)[2] == "gls") {
    c1 <- as.numeric(outp$coefficients[v1])
    c2 <- as.numeric(outp$coefficients[v2])

    cccov <- outp$varBeta[v2, v1]
  }

  if (class(outp)[2] == "lme") {
    c1 <- as.numeric(outp$coefficients$fixed[v1])
    c2 <- as.numeric(outp$coefficients$fixed[v2])

    cccov <- outp$varFix[v2, v1]
  }

  c1se <- outp$tTable[v1, 2]
  c2se <- outp$tTable[v2, 2]

  if (fun == "A") vval[1] <- (c1 + c2) / 2
  if (fun == "S") vval[1] <- c1 + c2
  if (fun == "D") vval[1] <- c1 - c2

  if (fun == "A") vval[2] <- (c1se^2 + c2se^2 + 2 * cccov) / 4
  if (fun == "S") vval[2] <- c1se^2 + c2se^2 + 2 * cccov
  if (fun == "D") vval[2] <- c1se^2 + c2se^2 - 2 * cccov

  vval[2] <- sqrt(vval[2])
  vval[3] <- 2 - 2 * pnorm(abs(vval[1] / vval[2]))

  return(vval)
}
