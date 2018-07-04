#' @name variable_view
#' @title Variable names with labels like in SPSS
#' 
#' @param data the lme model object.
#'
#' @details Example call: variable_view(acipair)
#' @export 
#'
variable_view <- function(data){
  require(dplyr)
  my.list = list()
  
  for (i in names(data)){
    #if the label is numeric then it's a "labels"; if it's null then it has neither a label or labels
    label = (c(i, ifelse(is.numeric(attr(data[[as.name(i)]],"label")) | is.null(attr(data[[as.name(i)]],"label")), 
                         NA, 
                         attr(data[[as.name(i)]],"label"))))
    my.list[[i]] = label
  }
  
  attributes = data.frame(matrix(unlist(my.list),ncol = 2,byrow = TRUE)) %>%
    rename(variable = X1, label = X2)
  
  return(attributes)
}