#' @name graphMod
#' @title Graph a Moderation Effect
#' 
#' @param data the data.
#' @param x the x variable given as data$x.
#' @param y the y variable given as data$y.
#' @param mod the moderator given as data$mod.
#' @param highMod  the model ran with HIGH_mod (can be gls or lme objects).
#' @param lowMod  the model ran with LOW_mod (can be gls or lme objects).
#' @param int coefficient position of the y-intercept.
#' @param slp coefficient position of the slope of x.
#' @param hlab text label for "high" level of moderator.
#' @param llab text label for "low" level of moderator.
#'
#' @details This is function only works for numerical-numerical interactions. It returns a ggplot object.
#' @export 
#'
graphMod <- function(data, x, y, mod, highMod, lowMod, int, slp, hlab = "High", llab = "Low"){
  require(dplyr)
  require(ggplot2)
  
  d <- data %>%
    mutate(mod = mod, xvar = x, yvar = y) %>%
    select(mod, xvar, yvar) %>%
    na.omit() %>%
    mutate(ModSplit = ifelse(mod >= mean(mod), 
                             hlab, llab))
  
  if(class(highMod)=="gls"){
    cc <- data.frame(slope = c(coef(lowMod)[slp], coef(highMod)[slp]), 
                     intercept = c(coef(lowMod)[int], coef(highMod)[int]), 
                     ModSplit = c(llab, hlab))
  }
  
  if(class(highMod)=="lme"){
    cc <- data.frame(slope = c(unlist(coef(lowMod)[slp])[1], unlist(coef(highMod)[slp])[1]), 
                     intercept = c(unlist(coef(lowMod)[int])[1], unlist(coef(highMod)[int])[1]), 
                     ModSplit = c(llab, hlab))
  }
  
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