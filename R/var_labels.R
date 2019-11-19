#' Creates a `tbl_df` that contains the column names and variable labels to
#' easily explore the data.
#' @export
#' @title var_labels
#' @param data a data.frame
var_labels <- function(data) {
  if(!is.data.frame(data)){
    stop("data.frame expected.")
  }
  if(all(sjlabelled::get_label(data) == "")) {
   stop("Data does not have any variable labels.") 
  }
  var_labels <- tibble::tibble(column_name = colnames(data),
                               variable_label = sjlabelled::get_label(data))
}
