#' @name confintLME
#' @title Confidence Intervals for LME Fixed Effects
#'
#' @param outp the lme model object.
#'
#' @details This function returns the confidence intervals in an organized fashion.
#' @export
#'
confintLME <- function(outp) {
  rownames <- names(outp$coefficients$fixed)

  CI <- data.frame(intervals(outp, which = "fixed")$fixed[c(1:length(rownames)), c(1, 3)],
    row.names = rownames
  )

  names(CI) <- c("2.5%", "97.5%")

  return(CI)
}

globalVariables(c("intervals"))
