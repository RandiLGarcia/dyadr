counts_labels <- function(data, x) {
  #if factor convert to numeric
  dims <- dim(data)
  counts <- data %>%
    select_(x) %>%
    group_by_(x) %>%
    count_()
  labels <- tibble(variable_label = 
                     get_labels(data[[x]]))
  data.table::setDT(labels, keep.rownames = TRUE)[]
  labels$rn <- as.numeric(labels[,rn])
  names(counts)[1] <- "x"
  x_bins <- counts %>%
    right_join(labels, by = c("x" = "rn"))
  names(x_bins)[1] <- c(x, "n", "variable_label")
  x_bins[["n"]][is.na(x_bins[["n"]])] <- 0
  x_bins <- x_bins %>%
    mutate(percent = round((n / dims[[1]]) * 100))
  x_bins <- x_bins %>%
    select(1, variable_label, everything())
  return(x_bins)
}