var_labels <- function(data) {
    var_labels <- tibble(column_name = colnames(data),
                         variable_label = sjlabelled::get_label(data))
}
