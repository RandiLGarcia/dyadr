#' @name graphMod
#' @title Graph a Moderation Effect
#' 
#' @param data the data.
#' @param x the x variable given as data$x.
#' @param y the y variable given as data$y.
#' @param mod the moderator given as data$mod.
#' @param highMod  the model ran with HIGH_mod.
#' @param lowMod  the model ran with LOW_mod.
#' @param int coefficient position of the y-intercept.
#' @param slp coefficient position of the slope of x.
#'
#' @details This is function only works for numerical-numerical interactions. It returns a ggplot object.
#' @export 
#'
graphMod <- function(data, x, y, mod, highMod, lowMod, int, slp){
  require(dplyr)
  require(ggplot2)
  
  d <- data %>%
    mutate(mod = mod, xvar = x, yvar = y) %>%
    mutate(ModSplit = ifelse(mod >= mean(mod), 
                             "High", "Low"))
  
  cc <- data.frame(slope = c(coef(lowMod)[slp], coef(highMod)[slp]), 
                   intercept = c(coef(lowMod)[int], coef(highMod)[int]), 
                   ModSplit = c("Low", "High"))
  
  plot <- ggplot(d, aes(x = xvar, y = yvar)) +
    geom_point(aes(group = ModSplit, 
                   color = ModSplit), 
               alpha = .5) +
    geom_abline(data = cc, 
                aes(intercept = intercept, 
                    slope = slope, 
                    color = ModSplit), 
                size = 1) 
  
  return(plot)
}