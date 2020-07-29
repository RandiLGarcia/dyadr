#' @name variable_view
#' @title Variable names with labels like in SPSS
#'
#' @param data the lme model object.
#'
#' @examples
#' variable_view(acipair)
#' @export
#'
variable_view <- function(data) {
  my.list <- list()

  for (i in names(data)) {
    # if the label is numeric then it's a "labels"; if it's null then it has neither a label or labels
    label <- (c(i, ifelse(is.numeric(attr(data[[as.name(i)]], "label")) | is.null(attr(data[[as.name(i)]], "label")),
      NA,
      attr(data[[as.name(i)]], "label")
    )))
    my.list[[i]] <- label
  }

  attributes <- data.frame(matrix(unlist(my.list), ncol = 2, byrow = TRUE))

  colnames(attributes)[1] <- "variable"
  colnames(attributes)[2] <- "label"

  return(attributes)
}
